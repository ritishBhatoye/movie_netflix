import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

const String apiKey = '5ec27fca69ea1369a1c1ab746a5e199b';
const String tmdbBaseUrl = 'https://api.themoviedb.org/3';

class StreamingPlayer extends StatefulWidget {
  @override
  _StreamingPlayerState createState() => _StreamingPlayerState();
}

class _StreamingPlayerState extends State<StreamingPlayer> {
  late Future<List<Movie>> movies;

  @override
  void initState() {
    super.initState();
    movies = fetchMovies();
  }

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
      Uri.parse('$tmdbBaseUrl/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                          movieId: snapshot.data![index].id,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class MovieDetailScreen extends StatefulWidget {
  final int movieId;
  MovieDetailScreen({required this.movieId});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<String?> trailerUrl;

  @override
  void initState() {
    super.initState();
    trailerUrl = fetchTrailerUrl();
  }

  Future<String?> fetchTrailerUrl() async {
    final response = await http.get(
      Uri.parse('$tmdbBaseUrl/movie/${widget.movieId}/videos?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      final String? trailerKey = data.isNotEmpty ? data[0]['key'] : null;
      return trailerKey != null
          ? 'https://www.youtube.com/watch?v=$trailerKey'
          : null;
    } else {
      throw Exception('Failed to load trailer URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Trailer'),
      ),
      body: FutureBuilder<String?>(
        future: trailerUrl,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return VideoPlayerWidget(videoUrl: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class Movie {
  final int id;
  final String title;

  Movie({required this.id, required this.title});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
    );
  }
}

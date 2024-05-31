import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveScreen extends StatefulWidget {
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  late List<dynamic> _liveStreams = [];

  @override
  void initState() {
    super.initState();
    _getLiveStreams();
  }

  Future<void> _getLiveStreams() async {
    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&eventType=live&type=video&maxResults=50&key=AIzaSyDt6Q_YdTOQ_U1ah6INnMMYC_SKfh42QFo'));

    if (response.statusCode == 200) {
      setState(() {
        _liveStreams = json.decode(response.body)['items'];
      });
    } else {
      throw Exception('Failed to load live streams');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,

                height: 200, // Fixed height for the YoutubePlayer
                child: _liveStreams.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : LiveStreamPlayer(
                        videoId: _liveStreams[0]['id']['videoId']),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _liveStreams.isEmpty
                      ? 'No live streams available'
                      : _liveStreams[0]['snippet']['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _liveStreams.length,
                  itemBuilder: (context, index) {
                    final liveStream = _liveStreams[index];
                    return ListTile(
                      leading: Image.network(
                        liveStream['snippet']['thumbnails']['default']['url'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        liveStream['snippet']['title'],
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveStreamPlayer extends StatelessWidget {
  final String videoId;

  LiveStreamPlayer({required this.videoId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}

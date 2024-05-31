import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  final String videoID;
   PlayerScreen({super.key, required this.videoID});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late List<dynamic> _videos = []; // Initialize _videos with an empty list

 
  @override
  void initState() {
    super.initState();

    _getVideos();
  }

  Future<void> _getVideos() async {
    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/youtube/v3/videos?part=snippet,contentDetails&chart=mostPopular&maxResults=50&videoDuration=long&key=AIzaSyCsz7LaUYwOmsEhr13uMfb5gb8HMb1IXL4'));

    if (response.statusCode == 200) {
      final List<dynamic> videos = json.decode(response.body)['items'];
      setState(() {
        _videos = videos.where((video) {
          final String duration = video['contentDetails']['duration'];
          final bool isHourOrMore =
              duration.contains('H') || duration.startsWith('PT');
          return isHourOrMore;
        }).toList();
      });
    } else {
      throw Exception('Failed to load videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('YouTube Videos'),
      // ),
      //  appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   automaticallyImplyLeading: false,
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.arrow_back),
      //   //   onPressed: () {
            
      //   //     Navigator.pop(context); // Navigate back to the previous screen
      //   //   },
      //   // ),
      // ),
      body: SafeArea(
        top: false,
        left: false,
        bottom: false,
        right: false,

        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height ,
                child: _videos.isEmpty
                ? Center(child: CircularProgressIndicator(color: Colors.red,strokeWidth: 3,))
                : NetflixVideoPlayer(videoId: widget.videoID), 
                ),
              ]
            ),
            // Text(
            //   _videos.isEmpty
            //       ? 'No videos available'
            //       : _videos[0]['snippet']['title'],
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _videos.length,
            //     itemBuilder: (context, index) {
            //       final video = _videos[index];
            //       return ListTile(
            //         leading: Image.network(
            //           video['snippet']['thumbnails']['default']['url'],
            //           width: 100,
            //           height: 100,
            //           fit: BoxFit.cover,
            //         ),
            //         title: Text(video['snippet']['title']),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class NetflixVideoPlayer extends StatefulWidget {
  final String videoId;
  
  NetflixVideoPlayer({required this.videoId});

  @override
  _NetflixVideoPlayerState createState() => _NetflixVideoPlayerState();
}

class _NetflixVideoPlayerState extends State<NetflixVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(

      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]); // Force landscape orientation

   
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Center(
            child: AspectRatio(
              aspectRatio: 16/9,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                progressColors: ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
                 aspectRatio:  9/16, 
                onReady: () {
                  print('Player is ready.');
                },
                onEnded: (metadata) {
                  print('Video has ended.');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {

     SystemChrome.setPreferredOrientations([
DeviceOrientation.portraitUp,
DeviceOrientation.portraitDown
    ]); 
    _controller.dispose();
    super.dispose();


  }
}

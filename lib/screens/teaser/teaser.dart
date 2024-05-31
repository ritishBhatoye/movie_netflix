import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_share/flutter_share.dart';

class Teaser extends StatefulWidget {
  @override
  _TeaserState createState() => _TeaserState();
}

class _TeaserState extends State<Teaser> with SingleTickerProviderStateMixin {
  late YoutubePlayerController _controller;
  int _currentVideoIndex = 0;

  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<String> shorts = [
    'hLN7p5HFhPU',
    'vBkPBe8ABNU',
    'HDlFi6CYOCM',
    'ZIgfKgnxOr0',
    '6bxOg6L3q1U',
    'dG-mu5ZZb_o',
    'X23wKrdqse0',
    'qjqV7deebO8',
    'MJkOF4Gbt18',
    'tZ4gg-UAgC8',
    'eXUzmS_Qaus',
    'HWLXSp5dAHo',
    'ZfTgF7vI3mI',
    'hOKHfI5mpH0',
    'CghPUq9GvmI',
    'O9WJX_pApBo',
    'EclwoVfNgOA',
    'N0462_g6mRg',
    '6WJvNYwMY6U',
    '6vnuzRN9CkA'
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: shorts[_currentVideoIndex],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: false,
      ),
    )..addListener(() {
        if (_controller.value.playerState == PlayerState.ended) {
          _playNextVideo();
        }
      });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(_animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _playNextVideo() {
    setState(() {
      _currentVideoIndex = (_currentVideoIndex + 1) % shorts.length;
      _controller.load(shorts[_currentVideoIndex]);
      _controller.play();
    });
  }

  Future<void> _shareVideo() async {
    final String videoLink =
        'https://www.youtube.com/watch?v=${shorts[_currentVideoIndex]}';
    final String message = 'Check out this video: $videoLink';

    await FlutterShare.share(
      title: 'Share Video',
      text: message,
      linkUrl: videoLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title:
      //   Text(
      //     "Teaser",
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.share),
      //       onPressed: _shareVideo,
      //     ),
      //   ],
      // ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            _playNextVideo();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: Colors.red,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          spreadRadius: _animation.value,
                          blurRadius: _animation.value,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: YoutubePlayer(
                        controller: _controller,
                        aspectRatio: 9 / 16,
                        showVideoProgressIndicator: true,
                        onReady: () {},
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

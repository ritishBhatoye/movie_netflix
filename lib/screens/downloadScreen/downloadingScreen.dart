import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix_clone/screens/player/PlayerScreen.dart';
import 'package:netflix_clone/utils/download_util.dart'; // You will need to implement this utility for downloading videos.

class DownloadMovieScreen extends StatefulWidget {
  final String mTitle;
  DownloadMovieScreen({super.key, required this.mTitle});

  @override
  _DownloadMovieScreenState createState() => _DownloadMovieScreenState();
}

class _DownloadMovieScreenState extends State<DownloadMovieScreen> {
  late TextEditingController _searchController;
  List<dynamic> _searchResults = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.mTitle + ' Full movie');
    _searchVideos(_searchController.text); // Call search method with initial value
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  // final String apiKey = 'AIzaSyCsz7LaUYwOmsEhr13uMfb5gb8HMb1IXL4';
  //   final String apiUrl = 'https://www.googleapis.com/youtube/v3/search'`
  Future<void> _searchVideos(String query) async {
    final String apiKey = 'AIzaSyCsz7LaUYwOmsEhr13uMfb5gb8HMb1IXL4';
    final String apiUrl = 'https://www.googleapis.com/youtube/v3/search'
        '?part=snippet'
        '&q=$query'
        '&key=$apiKey'
        '&maxResults=3' // Maximum results
        '&type=video' // Filter only videos
        '&videoDuration=long'; // Filter videos with duration longer than 20 minutes

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _searchResults = data['items'];
        _loading = false;
      });
    } else {
      throw Exception('Failed to load search results');
    }
  }

  Future<void> _downloadVideo(String videoId, String resolution) async {
    // Implement the functionality to download the video using the videoId and resolution
    // Use a package like youtube_dl or a similar utility to handle the download
    await DownloadUtil.downloadVideo(videoId, resolution);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Download Movie', style: TextStyle(color: Colors.white)),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            String query = _searchController.text;
                            if (query.isNotEmpty) {
                              _searchVideos(query);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      var video = _searchResults[index];
                      return ListTile(
                        leading: Image.network(video['snippet']['thumbnails']['default']['url']),
                        title: Text(video['snippet']['title'], style: TextStyle(color: Colors.white, fontSize: 16)),
                        subtitle: Text(video['snippet']['channelTitle']),
                        onTap: () async {
                          String videoId = video['id']['videoId']; // Extract video ID from the search results
                          String? selectedResolution = await _showResolutionDialog();
                          if (selectedResolution != null) {
                            _downloadVideo(videoId, selectedResolution);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Future<String?> _showResolutionDialog() async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Resolution'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('1080p'),
                onTap: () => Navigator.pop(context, '1080p'),
              ),
              ListTile(
                title: Text('720p'),
                onTap: () => Navigator.pop(context, '720p'),
              ),
              ListTile(
                title: Text('480p'),
                onTap: () => Navigator.pop(context, '480p'),
              ),
              ListTile(
                title: Text('360p'),
                onTap: () => Navigator.pop(context, '360p'),
              ),
            ],
          ),
        );
      },
    );
  }
}

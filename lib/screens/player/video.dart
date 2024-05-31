import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix_clone/screens/player/PlayerScreen.dart';
class SearchFilterScreen extends StatefulWidget {
  final String mTitle;
  SearchFilterScreen({super.key, required this.mTitle});
  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  late TextEditingController _searchController;
  List<dynamic> _searchResults = [];

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
      });
    } else {
      throw Exception('Failed to load search results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Choose the Best Resolution',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Visibility(
            visible:false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
               TextField(
            
                controller: _searchController,
                decoration: InputDecoration(
                  // labelText: 'Search',
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
                  title: Text(video['snippet']['title'],style: TextStyle(color: Colors.white,fontSize: 16),),
                  subtitle: Text(video['snippet']['channelTitle']),
                 onTap: () {
  String videoId = video['id']['videoId']; // Extract video ID from the search results
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PlayerScreen(videoID: videoId),
    ),
  );
},

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

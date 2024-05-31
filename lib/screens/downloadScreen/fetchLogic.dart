import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> fetchYouTubeVideos(String query) async {
  final apiKey = 'AIzaSyCsz7LaUYwOmsEhr13uMfb5gb8HMb1IXL4';
  final url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=$apiKey';
  // final String apiKey = 'AIzaSyCsz7LaUYwOmsEhr13uMfb5gb8HMb1IXL4';
  //   final String apiUrl = 'https://www.googleapis.com/youtube/v3/search'`
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<String> videoIds = [];

    for (var item in data['items']) {
      videoIds.add(item['id']['videoId']);
    }

    return videoIds;
  } else {
    throw Exception('Failed to load YouTube videos');
  }
}

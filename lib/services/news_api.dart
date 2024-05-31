import 'dart:convert';
// import 'package:doctor_booking_app/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/entertainmentNews.dart';

final endpointUrl =
    'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=6504b7d828a445f1a9b293bc1a044b42';

// 'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=6504b7d828a445f1a9b293bc1a044b42';

Future<List<Articles>> getArticle() async {
  http.Response res = await http.get(Uri.parse(endpointUrl));

  if (res.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(res.body);

    List<dynamic> body = json['articles'];

    List<Articles> articles =
        body.map((dynamic item) => Articles.fromJson(item)).toList();

    return articles;
  } else {
    throw ('cant get the articles');
  }
}

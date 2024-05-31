import 'package:flutter/material.dart';
import 'package:netflix_clone/assistant/pages/home_page.dart';

class AppAssistant extends StatelessWidget {
  const AppAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageAssistant(),
      theme: ThemeData(
          fontFamily: 'SpaceGrotesk',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey.shade900,
          primaryColor: Colors.grey.shade900),
    );
  }
}

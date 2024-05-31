import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:netflix/screens/home/welcome.dart';
import 'package:netflix_clone/screens/home/welcome.dart';

class AssisSplashscreen
 extends StatefulWidget {
  const AssisSplashscreen({super.key});

  @override
  State<AssisSplashscreen> createState() => _AssisSplashscreenState();
}

class _AssisSplashscreenState extends State<AssisSplashscreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/netflix.json"));
  }
}

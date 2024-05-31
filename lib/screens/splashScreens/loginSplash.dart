import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/screens/home/welcome.dart';


class LoginSplashScreen extends StatefulWidget {
  @override
  _LoginSplashScreenState createState() => _LoginSplashScreenState();
}

class _LoginSplashScreenState extends State<LoginSplashScreen> {
  @override
   void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
  }
  @override
   @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/loading.json"));
  }
}

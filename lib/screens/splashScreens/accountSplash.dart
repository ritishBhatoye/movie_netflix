import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/screens/MainScreen/mainScreen.dart';
import 'package:netflix_clone/screens/home/welcome.dart';


class AccountSplashScreen extends StatefulWidget {
  @override
  _AccountSplashScreenState createState() => _AccountSplashScreenState();
}

class _AccountSplashScreenState extends State<AccountSplashScreen> {
  @override
   void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    });
  }
  @override
   @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/accountSplashScreen.json"));
  }
}

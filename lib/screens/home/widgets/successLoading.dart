import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/screens/home/welcome.dart';
import 'package:netflix_clone/widgets/bottom_nav_bar.dart';

class SuccessLoading extends StatefulWidget {
  const SuccessLoading({super.key});

  @override
  State<SuccessLoading> createState() => _SuccessLoadingState();
}

class _SuccessLoadingState extends State<SuccessLoading> {

  @override
  void initState() {
    super.initState();
    // Call your navigation function here
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    // Use Navigator to push the next screen onto the navigation stack
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()), // Replace NextScreen() with the widget for your next screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/success.json', // Replace with your Lottie animation file
              // width: 200,
              // height: 200,
              fit: BoxFit.cover,
            ),
            // SizedBox(height: 20),
            // Text(
            //   'Payment Successful!',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      );
  }
}
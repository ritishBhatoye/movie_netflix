import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessLoading extends StatefulWidget {
  const SuccessLoading({super.key});

  @override
  State<SuccessLoading> createState() => _SuccessLoadingState();
}

class _SuccessLoadingState extends State<SuccessLoading> {
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
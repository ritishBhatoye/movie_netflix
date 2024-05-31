import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/screens/splashScreens/loginSplash.dart';

// import 'package:netflix/screens/home/welcome.dart';
import 'package:netflix_clone/screens/home/welcome.dart';
import 'package:netflix_clone/screens/splashScreens/loginSplash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginSplashScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/netflix.json"));
  }
}


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// // import 'package:netflix/screens/home/welcome.dart';
// import 'package:netflix_clone/screens/home/welcome.dart';
// import 'package:netflix_clone/screens/splashScreens/loginSplash.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 3), (timer) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => LoginSplashScreen()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Lottie.asset("assets/netflix.json"));
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:netflix_pages/screen/createStep1.dart';
// import 'package:netflix_pages/screen/signIn.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:netflix/screens/MainScreen/mainScreen.dart';
// // import 'package:netflix/screens/home/welcome.dart';
// // import 'package:netflix_clone/screens/MainScreen/mainScreen.dart';
// // import 'package:netflix_clone/screens/home/whoWatching.dart';

// class LogIn extends StatelessWidget {
//   const LogIn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Align(
//           alignment: Alignment.topLeft,
//           child: Center(
//             child: Container(
//                 width: 110,
//                 // padding: EdgeInsets.symmetric(horizontal: 50),
//                 height: 100,
//                 child: Image.asset("assets/logo.png")),
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         actions: [
//           Container(
//             width: MediaQuery.of(context).size.width * 0.2,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text("Help", style: TextStyle(color: Colors.white)),
//               ],
//             ),
//           )
//         ],
//       ),
//       body: Container(
//         color: Color.fromARGB(210, 29, 29, 29),
//         child: Center(
//           child: Container(
//             width: MediaQuery.sizeOf(context).width * 1.0,
//             height: MediaQuery.sizeOf(context).height * 1.0,
//             margin: EdgeInsets.symmetric(horizontal: 60).copyWith(top: 220),
//             child: Column(
//               children: [
//                 Container(
//                   height: 52.0,
//                   width: MediaQuery.sizeOf(context).width * 0.8,
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
//                   decoration: new BoxDecoration(
//                     borderRadius: BorderRadius.circular(3),
//                     color: Color.fromARGB(221, 67, 67, 67),
//                     shape: BoxShape.rectangle,
//                     border: new Border.all(
//                       color: Color.fromARGB(221, 67, 67, 67),
//                       width: 0.1,
//                     ),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         labelText: 'Email or phone number',
//                         labelStyle:
//                             TextStyle(fontSize: 17.4, color: Color(0xFFE6E6E6)),
//                         border: InputBorder.none),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   height: 52.0,
//                   width: MediaQuery.sizeOf(context).width * 0.8,
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
//                   decoration: new BoxDecoration(
//                     borderRadius: BorderRadius.circular(3),
//                     color: Color.fromARGB(221, 67, 67, 67),
//                     shape: BoxShape.rectangle,
//                     border: new Border.all(
//                       color: Color.fromARGB(221, 67, 67, 67),
//                       width: 0.1,
//                     ),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         labelText: 'Password',
//                         labelStyle:
//                             TextStyle(fontSize: 17.4, color: Color(0xFFE6E6E6)),
//                         border: InputBorder.none,
//                         suffixText: "SHOW",
//                         suffixStyle: TextStyle(color: Colors.white)),
//                   ),
//                 ),

//                 SizedBox(height: 20),
//                 Container(
//                   width: MediaQuery.sizeOf(context).width * 0.8,
//                   child: TextButton(
//                       style: TextButton.styleFrom(
//                           backgroundColor: Color(0xFFFE0202),
//                           foregroundColor: Color(0xFFE6E6E6),
//                           shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(Radius.zero))),
//                       child: const Text(
//                         "Log In",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700, fontSize: 15.5),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Createstep1()),
//                         );
//                       }
//                       ),
//                 ),
//                 SizedBox(height: 30),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "New to Netflix?",
//                         style: TextStyle(
//                             // fontWeight: FontWeight.w,
//                             fontSize: 15,
//                             color: Color(0xFFE6E6E6)),
//                       ),
//                       SizedBox(width: 4,),
//                        InkWell(
//                         onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignIn()),
//                         );
//                       },
//                          child: Text(
//                           "Sign In",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 15,
                         
//                               color: Color(0xFFE6E6E6)),
//                                                ),
//                        ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 35),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Sign in is proctected by Google reCAPTCHA to ensure ",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w900,
//                             fontSize: 13,
//                             color: Color(0xFFE6E6E6)),
//                       ),
//                       Text.rich(TextSpan(children: [
//                         TextSpan(
//                           text: "you're not a bot.",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w900,
//                               fontSize: 14,
//                               color: Color(0xFFE6E6E6)),
//                         ),
//                         TextSpan(
//                           text: " Learn more",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               color: Color(0xFFE6E6E6)),
//                         ),
//                       ]) // "Sign in is proctected by Google reCAPTCHA to ensure you're not a bot. Learn more",
//                           ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         //  color: Color.fromARGB(209, 40, 40, 40),
//       ),
//     );
//   }
// }

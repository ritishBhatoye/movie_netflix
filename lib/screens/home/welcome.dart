import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:netflix/screens/home/signIn.dart';
import 'package:netflix_clone/screens/home/signIn.dart';
import 'package:netflix_clone/screens/home/signIn_.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.topLeft,
          child: Container(
              width: 100, height: 100, child: Image.asset("assets/logo.png")),
        ),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Privacy",
                  style: TextStyle(color: Colors.white),
                ),
                Text("Help", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body:
       Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Expanded(
             child: ListView(
               padding: EdgeInsets.zero,
               children: <Widget>[
                 CarouselSlider(
                   
                   carouselController: CarouselController(),
                   items: [
                     Center(
                       child: Container(
                         margin: EdgeInsets.only(left: 45, right: 45, top: 70),
                         width: MediaQuery.sizeOf(context).width * 1,
       
                         // height: MediaQuery.sizeOf(context).height * 0.8,
                         // color: Colors.amber,
                         child: Column(
                           children: [
                             SizedBox(
                               height: 100,
                             ),
                             Container(
                                 width: 300,
                                 height: 280,
                                 child: Image.asset(
                                     "assets/welcome/watchEverywhere.jpg")),
                             Text(
                               "Watch",
                               style: GoogleFonts.ptSans(
                                   fontWeight: FontWeight.w900, fontSize: 35),
                             ),
                             Text(
                               "everywhere",
                               style: GoogleFonts.ptSans(
                                   fontWeight: FontWeight.w900, fontSize: 35),
                             ),
                             SizedBox(height: 20),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Stream on your phone, tablet,",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   Text(
                                     "laptop and TV.",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                 ])),
                             SizedBox(height: 20),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Create a Netflix account and more",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   Text.rich(TextSpan(children: [
                                     TextSpan(text: "at"),
                                     TextSpan(
                                       text: " netflix.com/more",
                                       style: GoogleFonts.ptSans(
                                           fontSize: 22,
                                           fontWeight: FontWeight.w500,
                                           color: Colors.blue),
                                       recognizer: TapGestureRecognizer()
                                         ..onTap = () => print('CLICKED'),
                                     )
                                   ]))
                                 ])),
                           ],
                         ),
                       ),
                     ),
                     Center(
                       child: Container(
                         margin: EdgeInsets.only(left: 45, right: 45, top: 70),
                         width: MediaQuery.sizeOf(context).width * 1,
       
                         // height: MediaQuery.sizeOf(context).height * 0.8,
       
                         child: Column(
                           children: [
                             SizedBox(
                               height: 100,
                             ),
                             Container(
                                 width: 300,
                                 height: 280,
                                 child:
                                     Image.asset("assets/welcome/everyFan.jpg")),
                             Text(
                               "There's a plan for",
                               style: GoogleFonts.ptSans(
                                   fontWeight: FontWeight.w900, fontSize: 35),
                             ),
                             Text(
                               "every fan",
                               style: GoogleFonts.ptSans(
                                   fontWeight: FontWeight.w900, fontSize: 35),
                             ),
                             SizedBox(height: 22),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Small price. Big entertainment.",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                 ])),
                             SizedBox(height: 14),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Create a Netflix account and more",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   Text.rich(TextSpan(children: [
                                     TextSpan(text: "at"),
                                     TextSpan(
                                       text: " netflix.com/more",
                                       style: GoogleFonts.ptSans(
                                           fontSize: 22,
                                           fontWeight: FontWeight.w500,
                                           color: Colors.blue),
                                       recognizer: TapGestureRecognizer()
                                         ..onTap = () => print('CLICKED'),
                                     )
                                   ]))
                                 ])),
                           ],
                         ),
                       ),
                     ),
                     Center(
                       child: Container(
                         margin: EdgeInsets.only(left: 45, right: 45, top: 70),
                         width: MediaQuery.sizeOf(context).width * 1,
       
                         // height: MediaQuery.sizeOf(context).height * 0.8,
       
                         child: Column(
                           children: [
                             SizedBox(
                               height: 100,
                             ),
                             Container(
                                 width: 300,
                                 height: 300,
                                 child: Image.asset(
                                     "assets/welcome/cancelAnytime.jpg")),
                             Text(
                               "Cancel online",
                               style: GoogleFonts.ptSans(
                                   fontWeight: FontWeight.w900, fontSize: 35),
                             ),
                             Text(
                               "anytime",
                               style: GoogleFonts.ptSans(
                                   fontWeight: FontWeight.w900, fontSize: 35),
                             ),
                             SizedBox(height: 20),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Join today, no reason to wait.",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                 ])),
                             SizedBox(height: 20),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Create a Netflix account and more",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   Text.rich(TextSpan(children: [
                                     TextSpan(text: "at"),
                                     TextSpan(
                                       text: " netflix.com/more",
                                       style: GoogleFonts.ptSans(
                                           fontSize: 22,
                                           fontWeight: FontWeight.w500,
                                           color: Colors.blue),
                                       recognizer: TapGestureRecognizer()
                                         ..onTap = () => print('CLICKED'),
                                     )
                                   ]))
                                 ])),
                           ],
                         ),
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.zero,
       
                       width: MediaQuery.sizeOf(context).width * 1,
                       height: MediaQuery.sizeOf(context).height * 1,
       
                       decoration: BoxDecoration(
                           image: DecorationImage(
                         image: AssetImage("assets/welcome/howDoiWatch.heic"),
                         fit: BoxFit.cover,
                       )),
                       // height: MediaQuery.sizeOf(context).height * 0.8,
       
                       child: Container(
                         padding: EdgeInsets.only(left: 40, right: 40, top: 350),
                         decoration: BoxDecoration(
                           gradient: LinearGradient(
                             begin: FractionalOffset.topLeft,
                             end: FractionalOffset.bottomCenter,
                             colors: [
                               // Color.fromARGB(147, 0, 0, 0).withOpacity(0.8),
                               // Color.fromARGB(166, 29, 29, 29)
                               //     .withOpacity(0.8),
                               // Color.fromARGB(165, 11, 11, 11)
                               //     .withOpacity(0.8),
                               Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                               Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                             ],
                             // stops: [
                             //   0.0,
                             //   0.25,
                             //   0.5,
                             //   0.75,
                             //   1.0
                             // ]
                           ),
                         ),
                         child: Column(
                           children: [
                             Text(
                               "How do I watch?",
                               style: GoogleFonts.ptSans(
                                   fontWeight: FontWeight.w900, fontSize: 35),
                             ),
                             SizedBox(height: 20),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Members that subscribe to Netflix",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   Text(
                                     "can watch here in the app.",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                 ])),
                             SizedBox(height: 20),
                             Align(
                                 alignment: Alignment.center,
                                 child: Column(children: [
                                   Text(
                                     "Create a Netflix account and more",
                                     style: GoogleFonts.ptSans(
                                         fontSize: 22,
                                         fontWeight: FontWeight.w500),
                                   ),
                                   Text.rich(TextSpan(children: [
                                     TextSpan(text: "at"),
                                     TextSpan(
                                       text: " netflix.com/more",
                                       style: GoogleFonts.ptSans(
                                           fontSize: 22,
                                           fontWeight: FontWeight.w500,
                                           color: Colors.blue),
                                       recognizer: TapGestureRecognizer()
                                         ..onTap = () => print('CLICKED'),
                                     )
                                   ]))
                                 ])),
                           ],
                         ),
                       ),
                     ),
                   ],
                   options: CarouselOptions(
                   autoPlayInterval: Duration(seconds: 4), // Set the duration between auto transitions
                  //  autoPlayCurve: Curves.fastOutSlowIn, // Set the animation curve for auto transitions
                   enableInfiniteScroll: true, // Set enableInfiniteScroll to true to allow infinite scrolling
                       height: _currentIndex == 3
                           ? MediaQuery.sizeOf(context).height * 1
                           : MediaQuery.sizeOf(context).height * 0.85,
                       enlargeCenterPage: true,
                       autoPlay: true,
                       aspectRatio: 1.0,
                       autoPlayAnimationDuration: Duration(microseconds: 800),
                       viewportFraction: 1,
                       onPageChanged:
                           (int index, CarouselPageChangedReason reason) {
                         setState(() {
                           _currentIndex = index;
                         });
                       }),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     for (int i = 0; i < 4; i++)
                       Container(
                         width: 6,
                         height: 6,
                         margin: EdgeInsets.symmetric(horizontal: 4),
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: i == _currentIndex
                               ? Color(0xFFFE0202)
                               : Color(0xFF737373),
                         ),
                       ),
                   ],
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 TextButton(
                     style: TextButton.styleFrom(
                         backgroundColor: Color(0xFFFE0202),
                         foregroundColor: Colors.white,
                         shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.zero))),
                     child: const Text(
                       "SIGN IN",
                       style: TextStyle(fontWeight: FontWeight.w600),
                     ),
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>  SignIn()),
                       );
                     })
                 // TextButton(
                 //   child: Text('SIGN UP'),
       
                 //   style:
                 //   ButtonStyle(
       
                 //     backgroundColor: MaterialStateColor.resolveWith(
                 //         (states) => Color(0xFFFE0202)),
       
                 //     foregroundColor: MaterialStateColor.resolveWith(
                 //         (states) => Colors.white),
                 //     // foregroundColor: Colors.white
                 //     //  Color(0xFFFE0202)
                 //   ),
                 //   onPressed: () {},
                 // ),
               ],
             ),
           ),
         ],
       ),
    );
  }
}

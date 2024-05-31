import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:netflix_clone/screens/home/widgets/user.dart';
import 'package:shimmer/shimmer.dart';  
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/assistant/main.dart';
import 'package:netflix_clone/assistant/pages/home_page.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/screens/MainScreen/myProfile/MyProfile.dart';
import 'package:netflix_clone/screens/MainScreen/new&hot/new&hot.dart';
import 'package:netflix_clone/screens/homescreen.dart';
import 'package:netflix_clone/screens/news_and_hot.dart';
import 'package:netflix_clone/screens/teaser/LiveStreaming.dart';
import 'package:netflix_clone/screens/teaser/discover.dart';
import 'package:netflix_clone/screens/teaser/teaser.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   final currentUser = FirebaseAuth.instance.currentUser;  
  late Stream<UserModel> userStream;
  @override 
  void initState(){
    super.initState();
    userStream=fetchUserData();
  }

  int _selectedIndex = 0;
 

  List _widgetOptions = [
    MoreScreen(),
    HomeScreen(),
    Discover(),
    // LiveScreen(),
    MyProfile(),
  ];
  OverlayEntry? _overlayEntry;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Stream<UserModel> fetchUserData() {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.uid)
        .snapshots()
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>));
  }
  void _toggleOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: 100.0,
        left: 20.0,
        child: SizedBox(height: 100, width: 100, child: AppAssistant()),
        // Material(
        //   color: Colors.transparent,
        //   child: Container(
        //     padding: EdgeInsets.all(16.0),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(8.0),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.2),
        //           blurRadius: 6.0,
        //           offset: Offset(0, 3),
        //         ),
        //       ],
        //     ),
        //     child: Text(
        //       'Your assistant is ready to help!',
        //       style: TextStyle(fontSize: 16.0),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:  StreamBuilder<UserModel>(
          stream: userStream,
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.active){
                if(snapshot.hasData){
                    final UserModel? user=snapshot.data;
          if(user!=null){
        return BottomNavigationBar(
          backgroundColor: Color(0xff323232),
          elevation: 0,
          //  showSelectedLabels: false,
          unselectedItemColor: Color(0xffB2B2B2),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              activeIcon: Container(
                width: 22,
                child: Image.asset(
                  "assets/BottomIcons/newNhot.png",
                  color: Colors.white,
                ),
              ),
              icon: Container(
                  width: 22,
                  child: Image.asset(
                    "assets/BottomIcons/newNhot_light.png",
                    color: Color(0xffB2B2B2),
                  )),
              // icon: Icon(
              //   Icons.home_outlined,
              //   color: Color.fromARGB(255, 153, 222, 215),
              // ),
              label: "New & Hot",
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              activeIcon: Container(
                width: 22,
                child: Image.asset(
                  "assets/BottomIcons/home.png",
                  color: Colors.white,
                ),
              ),
              icon: Container(
                  width: 22,
                  child: Image.asset(
                    "assets/BottomIcons/home_light.png",
                    color: Color(0xffB2B2B2),
                  )),
              // icon: Icon(
              //   Icons.home_outlined,
              //   color: Color.fromARGB(255, 153, 222, 215),
              // ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              activeIcon: Container(
                width: 22,
                child: Image.asset(
                  "assets/BottomIcons/teaser.png",
                  color: Colors.white,
                ),
              ),
              icon: Container(
                  width: 22,
                  child: Image.asset(
                    "assets/BottomIcons/teaser_light.png",
                    color: Color(0xffB2B2B2),
                  )),
              // icon: Icon(
              //   Icons.home_outlined,
              //   color: Color.fromARGB(255, 153, 222, 215),
              // ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              activeIcon: Container(
                width: 22,
                child: Image.asset(
                  "assets/BottomIcons/userProfile.png",
                ),
              ),
              icon: Container(
                  width: 22,
                  child: Image.asset(
                    "assets/BottomIcons/userProfile.png",
                  )),
              // icon: Icon(
              //   Icons.home_outlined,
              //   color: Color.fromARGB(255, 153, 222, 215),
              // ),
              label:"${user.name}",
              
              // 'My Netflix',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        );
          }
                }
                }
                 return Center(
                child: CircularProgressIndicator(color: Colors.red,),
              );
              }
             
      ),
    
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // Show the dialog when the floating action button is pressed
          showDialog(
            
            context: context,
            builder: (BuildContext context) {
              return FadeInUp
              (
                animate: true,
                    duration: Duration(milliseconds: 1000),
    
                delay: const Duration(microseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // The filter
                  child: Dialog(
                    // insetAnimationCurve:Curves.bounceIn,
                    // contentPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                   child :SizedBox(
                    
                // color: Colors.transparent,
                
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container
                            (
                              // padding: EdgeInsets.only(top: 300),
                              decoration: BoxDecoration
                            (
                              color: Colors.transparent,
                                    
                            ),
                
                            //  color:Colors.transparent,
                               width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height*0.848,
                              child: HomePageAssistant()),
                            // Text('Custom Dialog', style: TextStyle(fontSize: 20)),
                            // SizedBox(height: 20),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     // Close the dialog when the button is pressed
                            //     Navigator.of(context).pop();
                            //   },
                            //   child: Text('Close'),
                            // ),
                          ],
                        ),
                    ),
                    ),
                ),
              );
            },
          );
        },
       child: Icon(Icons.message_rounded, color: Colors.red),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => HomePageAssistant()),
      //     );
      //     // _toggleOverlay(context);
      //   },
      //   child: Icon(Icons.mic, color: Colors.red),
      // ),
    );
  }
}

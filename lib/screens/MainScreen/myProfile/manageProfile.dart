import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/models/userProfiles.dart';

class MangageProfile extends StatelessWidget {
  const MangageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    UserProf users = UserProf.users[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Manage Profiles?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("Done", style: TextStyle(color: Colors.white)))
        ],
      ),
      body: _ManageProf(
        user: users,
      ),
    );
  }
}

class _ManageProf extends StatelessWidget {
  const _ManageProf({super.key, required this.user});
  final UserProf user;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 1.0,
        width: MediaQuery.sizeOf(context).width * 1.0,
        margin: EdgeInsets.symmetric(vertical: 100, horizontal: 80),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                //      overflow: Overflow.visible,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/profile/prof1.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ), //Container
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   color: Colors.amber,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   image: DecorationImage(
                                      //       image: AssetImage("assets/profile/prof1.png"),
                                      //       fit: BoxFit.cover),
                                      // ),
                                      width: 250,
                                      height: 250,
                                      color: Color.fromARGB(142, 0, 0, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 130,
                                        child: Image.asset(
                                          "assets/profile/edit.png",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                // child: Image.asset(
                                //   "assets/profile/edit.png",
                                //   color: Colors.white,
                                // ),
                                ),
                          ),

                          // decoration: BoxDecoration(
                          //   color: Colors.amber,
                          //   borderRadius: BorderRadius.circular(10),
                          //   image: DecorationImage(
                          //       image: AssetImage("assets/profile/prof1.png"),
                          //       fit: BoxFit.cover),
                          // ),

                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15),
                          //   child: Image.asset("assets/profile/prof1.png"),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                //      overflow: Overflow.visible,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/profile/prof2.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ), //Container
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   color: Colors.amber,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   image: DecorationImage(
                                      //       image: AssetImage("assets/profile/prof1.png"),
                                      //       fit: BoxFit.cover),
                                      // ),
                                      width: 250,
                                      height: 250,
                                      color: Color.fromARGB(142, 0, 0, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 130,
                                        child: Image.asset(
                                          "assets/profile/edit.png",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                // child: Image.asset(
                                //   "assets/profile/edit.png",
                                //   color: Colors.white,
                                // ),
                                ),
                          ),

                          // decoration: BoxDecoration(
                          //   color: Colors.amber,
                          //   borderRadius: BorderRadius.circular(10),
                          //   image: DecorationImage(
                          //       image: AssetImage("assets/profile/prof1.png"),
                          //       fit: BoxFit.cover),
                          // ),

                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15),
                          //   child: Image.asset("assets/profile/prof1.png"),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                //      overflow: Overflow.visible,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/profile/prof3.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ), //Container
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   color: Colors.amber,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   image: DecorationImage(
                                      //       image: AssetImage("assets/profile/prof1.png"),
                                      //       fit: BoxFit.cover),
                                      // ),
                                      width: 250,
                                      height: 250,
                                      color: Color.fromARGB(142, 0, 0, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 130,
                                        child: Image.asset(
                                          "assets/profile/edit.png",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                // child: Image.asset(
                                //   "assets/profile/edit.png",
                                //   color: Colors.white,
                                // ),
                                ),
                          ),

                          // decoration: BoxDecoration(
                          //   color: Colors.amber,
                          //   borderRadius: BorderRadius.circular(10),
                          //   image: DecorationImage(
                          //       image: AssetImage("assets/profile/prof1.png"),
                          //       fit: BoxFit.cover),
                          // ),

                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15),
                          //   child: Image.asset("assets/profile/prof1.png"),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                //      overflow: Overflow.visible,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/profile/prof4.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ), //Container
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   color: Colors.amber,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   image: DecorationImage(
                                      //       image: AssetImage("assets/profile/prof1.png"),
                                      //       fit: BoxFit.cover),
                                      // ),
                                      width: 250,
                                      height: 250,
                                      color: Color.fromARGB(142, 0, 0, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 130,
                                        child: Image.asset(
                                          "assets/profile/edit.png",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                // child: Image.asset(
                                //   "assets/profile/edit.png",
                                //   color: Colors.white,
                                // ),
                                ),
                          ),

                          // decoration: BoxDecoration(
                          //   color: Colors.amber,
                          //   borderRadius: BorderRadius.circular(10),
                          //   image: DecorationImage(
                          //       image: AssetImage("assets/profile/prof1.png"),
                          //       fit: BoxFit.cover),
                          // ),

                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15),
                          //   child: Image.asset("assets/profile/prof1.png"),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 70),
                    width: 120,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                //      overflow: Overflow.visible,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/profile/prof5.png"),
                                          fit: BoxFit.cover),
                                    ),
                                  ), //Container
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   color: Colors.amber,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   image: DecorationImage(
                                      //       image: AssetImage("assets/profile/prof1.png"),
                                      //       fit: BoxFit.cover),
                                      // ),
                                      width: 250,
                                      height: 250,
                                      color: Color.fromARGB(142, 0, 0, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 130,
                                        child: Image.asset(
                                          "assets/profile/edit.png",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                // child: Image.asset(
                                //   "assets/profile/edit.png",
                                //   color: Colors.white,
                                // ),
                                ),
                          ),

                          // decoration: BoxDecoration(
                          //   color: Colors.amber,
                          //   borderRadius: BorderRadius.circular(10),
                          //   image: DecorationImage(
                          //       image: AssetImage("assets/profile/prof1.png"),
                          //       fit: BoxFit.cover),
                          // ),

                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15),
                          //   child: Image.asset("assets/profile/prof1.png"),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 70),
                //   width: 120,
                //   height: 200,
                //   child: Column(
                //     children: [
                //       Container(
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(15),
                //           child: Image.asset("assets/profile/prof5.png"),
                //         ),
                //       ),
                //       Text("Children"),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ));
  }
}

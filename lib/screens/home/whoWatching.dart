import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/screens/MainScreen/mainScreen.dart';
import 'package:netflix_clone/screens/splashScreens/accountSplash.dart';

class WhoWatching extends StatefulWidget {
  const WhoWatching({super.key});

  @override
  State<WhoWatching> createState() => _WhoWatchingState();
}

class _WhoWatchingState extends State<WhoWatching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Who's Watching?",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // actions: [Text("Edit", style: TextStyle(color: Colors.white))],
        ),
        body: Container(
            height: MediaQuery.sizeOf(context).height * 1.0,
            width: MediaQuery.sizeOf(context).width * 1.0,
            margin: EdgeInsets.symmetric(vertical: 100, horizontal: 80),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        openDialog();
                      },
                      child: Container(
                        width: 120,
                        height: 200,
                        child: Column(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset("assets/profile/prof1.png"),
                              ),
                            ),
                            Column(children: [
                              Text("Manmeet"),
                              Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.white,
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/profile/prof2.png"),
                            ),
                          ),
                          Text("Dhawal"),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/profile/prof3.png"),
                            ),
                          ),
                          Column(children: [
                            Text("Ritsh"),
                            Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white,
                            )
                          ]),
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/profile/prof4.png"),
                            ),
                          ),
                          Column(children: [
                            Text("Gurpreet"),
                            Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white,
                            )
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 70),
                      width: 120,
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/profile/prof5.png"),
                            ),
                          ),
                          Text("Children"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Future openDialog() => showDialog(
      barrierColor: Colors.black,
      context: context,
      builder: (context) => Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: 100,
            child: AlertDialog(
              backgroundColor: Colors.grey[100],
              title: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Enter your PIN to access ",
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      Text(
                        "this profile.",
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              content: SizedBox(
                height: 40,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: "",
                    // labelStyle: TextStyle(color: Colors.black)
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
              actions: [
                InkWell(
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountSplashScreen()
                            // MainScreen()
                            ),
                      );
                    }),
                Divider(),
                InkWell(
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                          fontFamily: 'RobotoMono',
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }
                    ),
                //  Divider(),
                // TextField(
                //   decoration: InputDecoration(labelText: "Enter your number"),
                //   keyboardType: TextInputType.number,
                //   inputFormatters: <TextInputFormatter>[
                //     FilteringTextInputFormatter.digitsOnly
                //   ], // Only numbers can be entered
                // ),
              ],
            ),
          ));
}

// class_showPasswordDialog() async {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Enter Password'),
//           content: TextFormField(
//             //not sure if i need this
//             initialValue: _phPassword,
//             controller: _textFieldController,
//             decoration: InputDecoration(hintText: 'Enter Password'),
//             maxLength: 15,
//             obscureText: true,
//             validator: (String value) {
//               if (value.isEmpty) {
//                 return 'Password is Required';
//               }
//               //maybe not necessary for toString()
//               if (value == _pass.toString()) {
//                 _getImage();
//               } else {
//                 return 'Please type in Correct Password';
//               }

//               return null;
//             },
//             onSaved: (String value) {
//               _phPassword = value;
//             },
//           ),
//           actions: [
//             FlatButton(
//               child: Text('Cancel'),
//               onPressed: () => Navigator.pop(context),
//             ),
//             //this needs to validate if the typed value was the same as the
//             //hardcoded password, it would run the _getImage() function
//             //the same as the validator in the TextFormField
//             FlatButton(
//               child: Text('OK'),
//               onPressed: () {},
//             ),
//           ],
//         );
//       });
// }

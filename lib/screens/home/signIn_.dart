import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/screens/home/createStep1.dart';
import 'package:netflix_clone/screens/home/welcome.dart';
import 'package:netflix_clone/widgets/bottom_nav_bar.dart';
// import 'package:netflixpages/screen/createStep1.dart';
// import 'package:netflixpages/screen/createStep3.dart';
// import 'package:netflixpages/screen/logIn.dart';
// // import 'package:lottie/lottie.dart';
// import 'package:netflix/screens/MainScreen/mainScreen.dart';
// import 'package:netflix/screens/home/welcome.dart';
// import 'package:netflix_clone/screens/MainScreen/mainScreen.dart';
// import 'package:netflix_clone/screens/home/whoWatching.dart';

// final FirebaseAuth _auth=FirebaseAuth.instance;

class SignIn extends StatefulWidget {

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final TextEditingController _fullNameController=TextEditingController();

  final TextEditingController _nameController=TextEditingController();

  final TextEditingController _emailController=TextEditingController();

  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();

  final TextEditingController _confirmPasswordController=TextEditingController();


bool _obscureText = true;
bool _obscureText2 = true;

  int _selectedIndex=0;

   @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }
  // Future<void> register() async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: _emailController.text.trim(),
  //             password: _passwordController.text.trim());

  //     String userId = userCredential.user!.uid;

  //     await FirebaseFirestore.instance.collection('users').doc(userId).set(
  //       {
  //         'id': userId,
  //         'name': nameController.text,
  //         'username': usernameController.text,
  //         'following': [],
  //         'followers': [],
  //       },
  //     );

  //     if (mounted) {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()));
  //     }
  //   } catch (e) {
  //     print("Error: ${e.toString()}");
  //     return;
  //   }
  // }


  Future<void> _register() async {
     try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              // phone:_phoneController.text.trim(),
              password: _passwordController.text.trim());

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('Users').doc(userId).set(
        {
          'id': userId,
          'name': _nameController.text,
          'password': _passwordController.text,
          'email':_emailController.text,
          // 'phone':_phoneController.text,
        },
      );

      if (mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Createstep1()));
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return;
    }
  }
 


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.topLeft,
          child: Center(
            child: Container(
                width: 110,
                // padding: EdgeInsets.symmetric(horizontal: 50),
                height: 100,
                child: Image.asset("assets/logo.png")),
          ),
        ),
        
        automaticallyImplyLeading: false,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Help", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(210, 29, 29, 29),
          child: Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              margin: EdgeInsets.symmetric(horizontal: 60).copyWith(top: 180),
              child: Column(
                children: [
                  Container(
                    
                    height: 52.0,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(221, 67, 67, 67),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Color.fromARGB(221, 67, 67, 67),
                        width: 0.1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 19.8),
                      enableSuggestions: false,
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(fontSize: 16.4, color: Color(0xFFE6E6E6)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20),
        
                  //    Container(
                    
                  //   height: 52.0,
                  //   width: MediaQuery.sizeOf(context).width * 0.8,
                  //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  //   decoration: new BoxDecoration(
                  //     borderRadius: BorderRadius.circular(3),
                  //     color: Color.fromARGB(221, 67, 67, 67),
                  //     shape: BoxShape.rectangle,
                  //     border: new Border.all(
                  //       color: Color.fromARGB(221, 67, 67, 67),
                  //       width: 0.1,
                  //     ),
                  //   ),
                  //   child: TextField(
                  //     controller: _phoneController,
                  //     decoration: InputDecoration(
                  //         labelText: 'Phone number',
                  //         labelStyle:
                  //             TextStyle(fontSize: 17.4, color: Color(0xFFE6E6E6)),
                  //         border: InputBorder.none),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
        
                  Container(
                    height: 52.0,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(221, 67, 67, 67),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Color.fromARGB(221, 67, 67, 67),
                        width: 0.1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 19.8),
        
                      enableSuggestions: false,
                      controller: _nameController,
        
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle:
                              TextStyle(fontSize: 16.4, color: Color(0xFFE6E6E6)),
                          border: InputBorder.none),
                    ),
                  ),
            //         TextField(
            //   controller: _nameController,
            //   autofocus: false,
            //   autocorrect: false,
            //   enableSuggestions: false,
            //   decoration: const InputDecoration(
            //     filled: true,
            //     fillColor: Colors.grey,
            //     labelText: 'Full Name',
            //     floatingLabelStyle: TextStyle(color: Colors.black),
            //     focusedBorder: InputBorder.none,
            //     border: InputBorder.none,
            //   ),
            // ),
                  SizedBox(height: 20),
                  Container(
                    height: 52.0,
                    width: MediaQuery.sizeOf(context).width ,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(221, 67, 67, 67),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Color.fromARGB(221, 67, 67, 67),
                        width: 0.1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 19.5),
        
                      controller: _passwordController,
        enableSuggestions: false,
        obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 16.4, color: Color(0xFFE6E6E6)),
                          border: InputBorder.none,
                          suffixIcon:  IconButton(
              icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,color: Colors.white,),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
                          //  "SHOW",
                          suffixStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
        
                   Container(
                    
                    height: 52.0,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(221, 67, 67, 67),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Color.fromARGB(221, 67, 67, 67),
                        width: 0.1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 19.5),
        obscureText: _obscureText2,
        
                      enableSuggestions: false,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle:
                              TextStyle(fontSize: 16.4, color: Color(0xFFE6E6E6)),
                          border: InputBorder.none,
                     
                          suffixIcon:  IconButton(
              icon: Icon(_obscureText2 ? Icons.visibility : Icons.visibility_off,color: Colors.white,),
              onPressed: () {
                setState(() {
                  _obscureText2 = !_obscureText2;
                });
              },
            ),
                          suffixStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: TextButton(
        
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFE0202),
                            foregroundColor: Color(0xFFE6E6E6),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15.5),
                        ),
                 
                        onPressed:  _register
                        // (){
                        //            Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Createstep1()),
                        //   );
                        // }
                        // _register
                  //       () async {
                  // final name = _nameController.text;
                  // final email = _emailController.text;
                  // final password = _passwordController.text;
        
                  // if (email.isEmpty || password.isEmpty) {
                  //   showDialog(context: context, builder: (_) => AlertDialog(
                  //     title: const Text('Error'),
                  //     content: const Text('Please enter your email and password'),
                  //     actions: [
                  //       TextButton(
                  //         child: const Text('OK'),
                  //         onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                  //       )
                  //     ],
                  //   ));
        
                  //   return;
                  // }
        
                
             
                //   // () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const LogIn()),
                        //   );
                        // }
                        ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color.fromARGB(167, 230, 230, 230)),
                        ),
                  SizedBox(width: 5),
        
                        InkWell(
                          onTap: (){
                             Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LogIn()));
                          },
                          
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in is proctected by Google reCAPTCHA to ensure ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              color: Color(0xFFE6E6E6)),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "you're not a bot.",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                color: Color(0xFFE6E6E6)),
                          ),
                          TextSpan(
                            text: " Learn more",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFFE6E6E6)),
                          ),
                        ]) // "Sign in is proctected by Google reCAPTCHA to ensure you're not a bot. Learn more",
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  color: Color.fromARGB(209, 40, 40, 40),
        ),
      ),
    );
  }
}


///**LOG IN SCREEN ****
///import 'dart:async';

// import 'package:lottie/lottie.dart';
// import 'package:netflix/screens/MainScreen/mainScreen.dart';
// import 'package:netflix/screens/home/welcome.dart';
// import 'package:netflix_clone/screens/MainScreen/mainScreen.dart';
// import 'package:netflix_clone/screens/home/whoWatching.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //  final TextEditingController _nameController=TextEditingController();

  final TextEditingController _emailController=TextEditingController();

  final TextEditingController _passwordController=TextEditingController();

  int _selectedIndex=0;
  bool _obscureText =true;
   @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }
    Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } catch (e) 
    {
      print(e);
      return;
    }
    if (mounted)
    {
      Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const  BottomNavBar()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.topLeft,
          child: Center(
            child: Container(
                width: 110,
                // padding: EdgeInsets.symmetric(horizontal: 50),
                height: 100,
                child: Image.asset("assets/logo.png")),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Help", style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(210, 29, 29, 29),
          child: Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              margin: EdgeInsets.symmetric(horizontal: 60).copyWith(top: 220),
              child: Column(
                children: [
                  Container(
                    height: 52.0,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(221, 67, 67, 67),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Color.fromARGB(221, 67, 67, 67),
                        width: 0.1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 19),
        
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email ',
                          labelStyle:
                              TextStyle(fontSize: 17.4, color: Color(0xFFE6E6E6)),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20),
                
                  Container(
                    height: 52.0,
                    width: MediaQuery.sizeOf(context).width ,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(221, 67, 67, 67),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Color.fromARGB(221, 67, 67, 67),
                        width: 0.1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 19),
        obscureText: _obscureText ,
                      controller: _passwordController,
                      decoration: InputDecoration(
        
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 17.4, color: Color(0xFFE6E6E6)),
                          border: InputBorder.none,
                          // suffixText: "SHOW",
                                                  suffixIcon:  IconButton(
              icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,color: Colors.white,),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
                          suffixStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
        
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFE0202),
                            foregroundColor: Color(0xFFE6E6E6),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15.5),
                        ),
                        onPressed: _login
              //           (){
              //              Navigator.push(context,
              // MaterialPageRoute(builder: (context) => const Createstep1()));
              //           }
                        // _login
                        // () {
        
        
                        //   // Navigator.push(
                        //   //   context,
                        //   //   MaterialPageRoute(
                        //   //       builder: (context) => const Createstep1()),
                        //   // );
                        // }
                        ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to Netflix?",
                          style: TextStyle(
                              // fontWeight: FontWeight.w,
                              fontSize: 15,
                              color: Color(0xFFE6E6E6)),
                        ),
                        SizedBox(width: 4,),
                         InkWell(
                          onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignIn()),
                          );
                        },
                           child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                           
                                color: Color(0xFFE6E6E6)),
                                                 ),
                         ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in is proctected by Google reCAPTCHA to ensure ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              color: Color(0xFFE6E6E6)),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "you're not a bot.",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                color: Color(0xFFE6E6E6)),
                          ),
                          TextSpan(
                            text: " Learn more",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFFE6E6E6)),
                          ),
                        ]) // "Sign in is proctected by Google reCAPTCHA to ensure you're not a bot. Learn more",
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  color: Color.fromARGB(209, 40, 40, 40),
        ),
      ),
    );
  }
}

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/screens/home/createStep3.dart';
import 'package:netflix_clone/screens/home/welcome.dart';
import 'package:netflix_clone/screens/homescreen.dart';
import 'package:netflix_clone/widgets/bottom_nav_bar.dart';
// import 'package:netflixpages/screen/createStep3.dart';
// import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';


class SignupPayment extends StatefulWidget {
  const SignupPayment({super.key});

  @override
  State<SignupPayment> createState() => _SignupPaymentState();
}

class _SignupPaymentState extends State<SignupPayment> {
  bool _obscureText=true;

  final TextEditingController _emailController=TextEditingController();

  final TextEditingController _passwordController=TextEditingController();

  int _selectedIndex=0;

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
      context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        // elevation: 1,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.topLeft,
          child: Container(
              width: 110,
              // padding: EdgeInsets.symmetric(horizontal: 50),
              height: 100,
              child: Image.asset("assets/logo.png")),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2.0), // Adjust the divider height as needed
            child: Divider(
              color: Colors.grey, // Customize the color of the divider
              thickness: 0.35, // Adjust the thickness of the divider
            ),
          ),
           automaticallyImplyLeading: false,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sign In", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
              ],
            ),
          )
        
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
        
            height: MediaQuery.sizeOf(context).height,
            // width: MediaQuery.sizeOf(context).width*0.9,
            margin: EdgeInsets.symmetric(vertical: 40,horizontal:30),
            child:SizedBox(
              // height: MediaQuery.sizeOf(context).height*1,
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [              
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "STEP "),
                      TextSpan(text: "2 ",style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "OF "),
                      TextSpan(text: "3 ",style: TextStyle(fontWeight: FontWeight.bold)),
        
        
                    ])),
                // Text("STEP 1 OF 3"),
                Text("Verify your Account to",style: TextStyle(color: Colors.white,fontSize: 31,fontWeight: FontWeight.bold),),
                Text("start your",style: TextStyle(color: Colors.white,fontSize: 31,fontWeight: FontWeight.bold),),
                Text("membership",style: TextStyle(color: Colors.white,fontSize: 31,fontWeight: FontWeight.bold),),
              
                SizedBox(height: 18,),
                Text("Just a few more steps and you're",style: TextStyle(color: Colors.white,fontSize: 21,),),
                Text("finished!",style: TextStyle(color: Colors.white,fontSize: 21,)),
                Text("We hate paperwork, too.",style: TextStyle(color: Colors.white,fontSize: 21,)),
                 SizedBox(height: 25,),
        
                  Column(
                    children: [
                      Container(
                        height: 68.0,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.transparent,
                          shape: BoxShape.rectangle,
                          border: new Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Email or phone number',
                              labelStyle:
                                  TextStyle(fontSize: 17.4, color:Colors.white),
                              border: InputBorder.none),
                        ),
                      ),
                       SizedBox(height: 15,),
                       Container(
                    height: 68.0,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          
                          labelText: 'Add a password',
                          labelStyle:
                              TextStyle(fontSize: 17.4, color: Colors.white,),
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
                    ],
                  ),
                  SizedBox(height: 32,),
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.8,
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    child: 
                   TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFE0202),
                                foregroundColor: Color(0xFFE6E6E6),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)))),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 27),
                            ),
                            onPressed: () {
        
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const  BottomNavBar()),
                          );
                            }),)
              ]
              )
              ))),
      ),
    );
  }


}
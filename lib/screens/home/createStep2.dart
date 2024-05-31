import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home/widgets/signUp.dart';
// import 'package:netflixpages/screen/widgets/signUp.dart';

class Createstep2 extends StatefulWidget {
  const Createstep2({super.key});

  @override
  State<Createstep2> createState() => _Createstep2State();
}

class _Createstep2State extends State<Createstep2> {
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
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sign In", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
              ],
            ),
          )
        
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          // width: MediaQuery.sizeOf(context).width*0.9,
          margin: EdgeInsets.symmetric(vertical: 100,horizontal:35),
          child:SizedBox(
            // height: MediaQuery.sizeOf(context).height*1,
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom:32),
                child:SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Image(
                             width: 70,
                        height: 70,
                        image: AssetImage("assets/laptop-90.png"),color: Colors.red,),
                      Image(
                             width: 70,
                        height: 70,
                        image: AssetImage("assets/tv-96.png"),color: Colors.red,),
                      Image(
                        width: 70,
                        height: 70,
                        image: AssetImage("assets/ipad-96.png"),color: Colors.red,),
                  
                      Image(image: AssetImage("assets/iphone.png"),color: Colors.red,),
                    ],
                  ),
                ),),
             
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "STEP "),
                    TextSpan(text: "2 ",style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "OF "),
                    TextSpan(text: "3 ",style: TextStyle(fontWeight: FontWeight.bold)),

                  ])),
              // Text("STEP 1 OF 3"),
              Text("Finitsh setting up your account",style: TextStyle(color: Colors.white,fontSize: 31,fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              Text("Netflix is personalised for you.",style: TextStyle(color: Colors.white,fontSize: 21,),),
              Text("Create a password to watch Netflix ",style: TextStyle(color: Colors.white,fontSize: 21,)),
              Text("on your mobile phone or tablet.",style: TextStyle(color: Colors.white,fontSize: 21,)),
               SizedBox(height: 25,),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.08,
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
                              builder: (context) => const SignupPayment()),
                        );
                          }),)
            ]
            )
            )))

    );
  }
}
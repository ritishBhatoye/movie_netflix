import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home/widgets/prices.dart';
// import 'package:netflixpages/screen/widgets/prices.dart';
class Createstep1 extends StatelessWidget {
  const Createstep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          color: Colors.black,
          margin: EdgeInsets.symmetric(vertical: 100,horizontal:50),
          child:SizedBox(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom:32),
                child:Image(image: AssetImage("assets/tickCircle.png"),color: Colors.red,),),
             
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "STEP "),
                    TextSpan(text: "1 ",style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "OF "),
                    TextSpan(text: "3 ",style: TextStyle(fontWeight: FontWeight.bold)),


                  ])),
              // Text("STEP 1 OF 3"),
              Text("Choose Your plan.",style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: 
              Column(children: [
                Row(children: [
                  Container(
                    width: 50
                    ,height: 45,
                    child: Image(image:  AssetImage("assets/done.png",),color: Colors.red,)),

                  Container(
          color: Colors.black,

                    margin: EdgeInsets.only(top: 15,left: 5),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("No commintments, cancel",style: TextStyle(fontSize: 19),),
                        Text("anytime.",style: TextStyle(fontSize: 19),),
                      ],
                    ),
                  ),

                  // Text(" anytime.",style: TextStyle(fontSize: 18),),

                  // Text.rich(TextSpan(children: [
                  //   TextSpan(text: "No commintments, cancel "),
                  //   TextSpan(text: "anytime."),

                  // ]))
                  // Text("No commintments,cancel anytime."),
                ],),
                    Row(children: [
                                   Container(
                                    
                    width: 50
                    ,height: 45,
                    child: Image(image:  AssetImage("assets/done.png",),color: Colors.red,)),

                  Container(
                    margin: EdgeInsets.only(top: 15,left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Everything on Flix for one ",style: TextStyle(fontSize: 19),),
                        Text("low price.",style: TextStyle(fontSize: 19),),
                      ],
                    ),
                  ),
                  // Text("Everything on Flix for one Low price"),
                ],),
                    Row(children: [
                    Container(
                    width: 50,
                    height: 45,
                    child: Image(image:  AssetImage("assets/done.png",),color: Colors.red,)),
                  Container(
                    margin: EdgeInsets.only(top: 11,left: 5),
                    child: Text("No ads and no extra fees.Ever.",style: TextStyle(fontSize: 18.5))),
                ],),
              ],
              )
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: MediaQuery.sizeOf(context).width*0.8,
                height: MediaQuery.sizeOf(context).height*0.07,

                child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFE0202),
                            foregroundColor: Color(0xFFE6E6E6),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 27),
                        ),
                        onPressed: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreatestepNext1()),
                        );
                        }),
              ),
            ],
        
          ) ,)
        
        ),
      ),
    );
  }
}
class CreatestepNext1 extends StatelessWidget {
  const CreatestepNext1({super.key});

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
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2.0), // Adjust the divider height as needed
            child: Divider(
              color: Colors.black, // Customize the color of the divider
              thickness: 0.35, // Adjust the thickness of the divider
            ),
          ),
        
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

      body: Center(
        child: Container(
          color: Colors.black,

          height: MediaQuery.sizeOf(context).height,
          // width: MediaQuery.sizeOf(context).width*0.9,
          margin: EdgeInsets.symmetric(vertical: 0,horizontal:20),
          child:SizedBox(
            
            // height: MediaQuery.sizeOf(context).height*1,
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   margin: EdgeInsets.only(bottom:32),
              //   child:Image(image: AssetImage("assets/tickCircle.png"),color: Colors.red,),),
             
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "STEP "),
                    TextSpan(text: "1 ",style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "OF "),
                    TextSpan(text: "3 ",style: TextStyle(fontWeight: FontWeight.bold)),


                  ])),
              // Text("STEP 1 OF 3"),
              Text("Choose Your plan that's right for you",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
             Container(
              
             color: Colors.black,

              // color: Colors.black,
              width: MediaQuery.sizeOf(context).width*1,
              height: MediaQuery.sizeOf(context).height*0.73,
              child: Prices()),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 22),
              //   child: 
              // Column(children: [
              //   Row(children: [
              //     Container(
              //       width: 50
              //       ,height: 45,
              //       child: Image(image:  AssetImage("assets/done.png",),color: Colors.red,)),

              //     Container(
              //       margin: EdgeInsets.only(top: 15,left: 5),

              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           Text("No commintments, cancel",style: TextStyle(fontSize: 19),),
              //           Text("anytime.",style: TextStyle(fontSize: 19),),
              //         ],
              //       ),
              //     ),

              //     // Text(" anytime.",style: TextStyle(fontSize: 18),),

              //     // Text.rich(TextSpan(children: [
              //     //   TextSpan(text: "No commintments, cancel "),
              //     //   TextSpan(text: "anytime."),

              //     // ]))
              //     // Text("No commintments,cancel anytime."),
              //   ],),
              //   //     Row(children: [
              //   //                    Container(
              //   //     width: 50
              //   //     ,height: 45,
              //   //     child: Image(image:  AssetImage("assets/done.png",),color: Colors.red,)),

              //   //   Container(
              //   //     margin: EdgeInsets.only(top: 15,left: 5),
              //   //     child: Column(
              //   //       crossAxisAlignment: CrossAxisAlignment.start,
              //   //       children: [
              //   //         Text("Everything on Flix for one ",style: TextStyle(fontSize: 19),),
              //   //         Text("low price.",style: TextStyle(fontSize: 19),),
              //   //       ],
              //   //     ),
              //   //   ),
              //   //   // Text("Everything on Flix for one Low price"),
              //   // ],),
              //   //     Row(children: [
              //   //     Container(
              //   //     width: 50,
              //   //     height: 45,
              //   //     child: Image(image:  AssetImage("assets/done.png",),color: Colors.red,)),
              //   //   Container(
              //   //     margin: EdgeInsets.only(top: 11,left: 5),
              //   //     child: Text("No ads and no extra fees.Ever.",style: TextStyle(fontSize: 18.5))),
              //   // ],),
              // ],
              // )
              // ),
              // Container(
              //   // margin: EdgeInsets.only(top: 30),
              //   width: MediaQuery.sizeOf(context).width*0.8,
              //   height: MediaQuery.sizeOf(context).height*0.07,

              //   child: TextButton(
              //           style: TextButton.styleFrom(
              //               backgroundColor: Color(0xFFFE0202),
              //               foregroundColor: Color(0xFFE6E6E6),
              //               shape: const RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.all(Radius.zero))),
              //           child: const Text(
              //             "Next",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w600, fontSize: 27),
              //           ),
              //           onPressed: () {
                
              //           }),
              // ),
            ],
        
          ) ,)
        
        ),
      ),
    );
  }
}
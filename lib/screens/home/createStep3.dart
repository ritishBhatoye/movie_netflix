import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:netflixpages/screen/createStep3.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/screens/home/widgets/successLoading.dart';
// import 'package:netflixpages/screen/widgets/successLoading.dart';
// import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// import 'package:flutter_upi_india/flutter_upi_india.dart';
class Createstep3 extends StatefulWidget {
  const Createstep3({super.key});

  @override
  State<Createstep3> createState() => _Createstep3State();
}

class _Createstep3State extends State<Createstep3> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_1DP5mmolF5G5ag',
      'amount': amount,
      'name': 'Geeks for Geeks',
      'prefill': {'contact': '7087963595', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error : e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    
    Fluttertoast.showToast(

        msg: "Payment Succesfull " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  
                  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SuccessLoading()),
                        );
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment fail " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _razorpay.clear();
  // }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  //  String environment="UAT_SIM";
  //   String appId="";
  //   String merchantId="PGTESTPAYUAT";
  //   bool enableLogging=true;

  //   String checksum="";
  //   String saltKey="099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
  //   String SaltIndex="1";
  //   String callbackUrl="https://webhook.site/callback-url";
  //   String body="";
  //   String apiEndPoint = "/pg/v1/pay";

  //   Object? result;

  // getCheckSum(){
  //   final requestData={

  // "merchantId": merchantId,
  // "merchantTransactionId": "MT7850590068188104",
  // "merchantUserId": "MUID123",
  // "amount": 1000,
  // "callbackUrl": "https://webhook.site/callback-url",
  // "mobileNumber": "7087963595",
  // "paymentInstrument": {
  //   "type": "PAY_PAGE"}

  //   };
  // String base64Body=base64.encode(utf8.encode(json.encode(requestData)));

  //     checksum="${sha256.convert(utf8.encode(base64Body + apiEndPoint +saltKey)).toString()}###$saltKey";

  //     return base64Body;
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   phonepeInit();
  //   body=getCheckSum().toString();
  // }

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
            preferredSize:
                Size.fromHeight(2.0), // Adjust the divider height as needed
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
                  Text("Sign In",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                ],
              ),
            )
          ],
        ),
        body: Center(
            child: Container(
          height: MediaQuery.sizeOf(context).height,
          // width: MediaQuery.sizeOf(context).width*0.9,
          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
          child: SizedBox(
              // height: MediaQuery.sizeOf(context).height*1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make the container a circle
                    border: Border.all(color: Colors.red, width: 2.5),
                  ),
                  margin: EdgeInsets.only(bottom: 32),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      width: 38,
                      image: AssetImage("assets/lock.png"),
                      color: Colors.red,
                    ),
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(bottom:32),
                //   child:Image(image: AssetImage("assets/tickCircle.png"),color: Colors.red,),),

                Text.rich(TextSpan(children: [
                  TextSpan(text: "STEP "),
                  TextSpan(
                      text: "3 ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "OF "),
                  TextSpan(
                      text: "3 ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ])),
                // Text("STEP 1 OF 3"),

                Text(
                  "Choose How to pay",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Your payment is encrypted and you can",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "change how you pay at any time.",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  "Secure for peace of mind.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Cancel easily online.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("End-to-End encrypted"),
                    Icon(
                      Icons.lock,
                      color: Colors.amber,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   height: MediaQuery.sizeOf(context).height * 0.11,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     shape: BoxShape.rectangle, // Make the container a circle
                //     border: Border.all(
                //         color: Color.fromARGB(213, 172, 172, 172), width: 2.5),
                //   ),
                //   child: ListTile(
                //     title: Text(
                //       "Credit or Debit Card",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     subtitle: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Image(
                //           image: AssetImage("assets/visa.png"),
                //           color: Color.fromARGB(255, 0, 0, 255),
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Container(
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5),
                //               shape: BoxShape
                //                   .rectangle, // Make the container a circle
                //               border: Border.all(
                //                   color: Color.fromARGB(213, 172, 172, 172),
                //                   width: 0.3),
                //             ),
                //             child: Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 8),
                //               child: Image(
                //                 image: AssetImage("assets/mastercard.png"),
                //               ),
                //             )),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Container(
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5),
                //               shape: BoxShape
                //                   .rectangle, // Make the container a circle
                //               border: Border.all(
                //                   color: Color.fromARGB(213, 172, 172, 172),
                //                   width: 0.3),
                //             ),
                //             child: Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 8),
                //               child: Image(
                //                 image: AssetImage("assets/dinersClub.png"),
                //               ),
                //             )),
                //       ],
                //     ),
                //     trailing: Icon(Icons.arrow_forward_ios),
                //   ),
                // ),

                // SizedBox(
                //   height: 10,
                // ),

                // Container(
                //   height: MediaQuery.sizeOf(context).height * 0.11,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     shape: BoxShape.rectangle, // Make the container a circle
                //     border: Border.all(
                //         color: Color.fromARGB(213, 172, 172, 172), width: 2.5),
                //   ),
                //   child: InkWell(
                //     onTap: () {},
                //     // startPgTransaction,
                //     child: ListTile(
                //       title: Text(
                //         "UPI AutoPay",
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       subtitle: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           // Image(image: AssetImage(""),color: Color.fromARGB(255, 0, 0, 255),),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 shape: BoxShape
                //                     .rectangle, // Make the container a circle
                //                 border: Border.all(
                //                     color: Color.fromARGB(213, 172, 172, 172),
                //                     width: 0.3),
                //               ),
                //               child: Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Image(
                //                   width: 40,
                //                   image: AssetImage("assets/bhim.png"),
                //                 ),
                //               )),

                //           SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 shape: BoxShape
                //                     .rectangle, // Make the container a circle
                //                 border: Border.all(
                //                     color: Color.fromARGB(213, 172, 172, 172),
                //                     width: 0.3),
                //               ),
                //               child: Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Image(
                //                   width: 40,
                //                   image: AssetImage("assets/phonePe.png"),
                //                 ),
                //               )),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 shape: BoxShape
                //                     .rectangle, // Make the container a circle
                //                 border: Border.all(
                //                     color: Color.fromARGB(213, 172, 172, 172),
                //                     width: 0.3),
                //               ),
                //               child: Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Image(
                //                   width: 40,
                //                   image: AssetImage("assets/amazonPay.png"),
                //                 ),
                //               )),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 shape: BoxShape
                //                     .rectangle, // Make the container a circle
                //                 border: Border.all(
                //                     color: Color.fromARGB(213, 172, 172, 172),
                //                     width: 0.3),
                //               ),
                //               child: Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Image(
                //                   width: 40,
                //                   image: AssetImage("assets/gpay.png"),
                //                 ),
                //               )),
                //         ],
                //       ),
                //       trailing: Icon(Icons.arrow_forward_ios),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: 
                  TextFormField(
                    cursorColor: Colors.white,
                    autofocus: false,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Enter the Amount to be paid',
                        labelStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15)),
                    controller: amtController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Amount to be paid';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed:(){ _razorpay.open({
                      "key": "rzp_test_atVo36MIyOX9bQ",
                    "amount":"50000"
                    });},

                      // if (amtController.text.toString().isNotEmpty) {
                      //   setState(() {
                      //     int amount = int.parse(amtController.text.toString());
                      //     openCheckout(amount);
                      //   });
                      // }
                    
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Make Payment'),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                    )),
              ])
              //      Padding(
              // padding: const EdgeInsets.all(16.0),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TextField(
              //       controller: amtController,
              //       decoration: InputDecoration(
              //         labelText: 'Enter Text',
              //         border: OutlineInputBorder(),
              //       ),
              //     ),
              //     SizedBox(height: 20),
              //     ElevatedButton(
              //       onPressed: () {
              //         // Perform actions when the button is pressed
              //         String enteredText = _textController.text;
              //         // Do something with the entered text
              //         print('Entered Text: $enteredText');
              //       },
              //       child: Text('Submit'),
              //     ),
              //   ],
              // ),
              ),
        )));
  }

  // void phonepeInit(){
  //   PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
  //       .then((val) => {
  //             setState(() {
  //               result = 'PhonePe SDK Initialized - $val';
  //             })
  //           })
  //       .catchError((error) {
  //     handleError(error);
  //     return <dynamic>{};
  //   });
  // }

  // void startPgTransaction() async{

  //   // try{
  //   //   var response=PhonePePaymentSdk.startTransaction(
  //   //     body,callbackUrl,checksum,{},apiEndPoint,"");
  //   //   response.then((val)=>{

  //   //   }).catchError((error){
  //   //     handleError(error);
  //   //     return <dynamic>{};
  //   //   });

  //   // }
  //   // catch(error){
  //   //   handleError(error);
  //   // }

  //     PhonePePaymentSdk.startTransaction(body, callbackUrl, checksum, "").then((response) => {
  //   setState(() {
  //                  if (response != null)
  //                       {
  //                          String status = response['status'].toString();
  //                          String error = response['error'].toString();
  //                          if (status == 'SUCCESS')
  //                          {
  //                            result="Flow complete - status : SUCCESS";
  //                            // "Flow Completed - Status: Success!";
  //                          }
  //                          else {
  //                           result="Flow complete - status : $status  and error $error";
  //                         // "Flow Completed - Status: $status and Error: $error";
  //                          }
  //                       }
  //                  else {
  //                           result="Flow incomplete";

  //                         // "Flow Incomplete";
  //                       }
  //               })
  // }).catchError((error) {
  // // handleError(error)
  // return <dynamic>{};
  // });

  // }

  // void handleError(error) {
  //   setState(() {
  //     result={"error":error};
  //   });
  // }
}

// class Payment_Button extends StatelessWidget {
//   const Payment_Button({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
// return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Field with Button Example'),
//       ),
//       body:

//     );
//   }
//   }
// }

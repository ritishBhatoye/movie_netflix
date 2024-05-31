import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:netflix/screen/createStep2.dart';
import 'package:netflix_clone/screens/home/createStep2.dart';
import 'package:netflix_clone/screens/home/createStep3.dart';
import 'package:netflix_clone/screens/home/widgets/successLoading.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:developer';
class Prices extends StatefulWidget {
  

  @override
  _PricesState createState() => _PricesState();
}

class _PricesState extends State<Prices> with SingleTickerProviderStateMixin {
  late TabController _tabController;
     late Razorpay _razorpay;
  TextEditingController amt1 = TextEditingController(text: '649');
  TextEditingController amt2 = TextEditingController(text:'499');
  TextEditingController amt3 = TextEditingController(text: '199');
  TextEditingController amt4 = TextEditingController(text: '149');


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
  //     void openCheckout(amount) async {
  //   amount = amount * 100;
  //   var options = {
  //     'key': 'rzp_test_1DP5mmolF5G5ag',
  //     'amount': amount,
  //     'name': 'Geeks for Geeks',
  //     'prefill': {'contact': '7087963595', 'email': 'test@gmail.com'},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };

  //   try {
  //     _razorpay.open(options);
  //   } catch (e) {
  //     debugPrint('Error : e');
  //   }
  // }
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


  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this); // Define the number of tabs
            _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
      backgroundColor: Colors.black,

        // title: Text('Tabs Outside AppBar Example'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [Container(
          color: Colors.black,
          // padding: EdgeInsets.symmetric(vertical: 10),
          // margin: EdgeInsets.only(bottom: 10),
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: 2.5),
                // padding: EdgeInsets.only(right: 10),
                controller: _tabController,
                // dividerColor: Colors.black,
                // isScrollable: true,
        
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:
        
                          // <Color>[Color.fromARGB(164, 0, 0, 0), Color.fromARGB(152, 158, 158, 158),Color.fromARGB(243, 255, 255, 255)]
        
                          <Color>[
                        Color.fromARGB(214, 0, 19, 167),
                        Color.fromARGB(209, 198, 0, 0),
                      ]),
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.red,
                ),
                labelColor: Colors.white,
                // labelStyle:
                //     const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                unselectedLabelColor: const Color.fromARGB(183, 255, 255, 255),
                tabs: [
                  Container(
        
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    width: MediaQuery.sizeOf(context).width * 0.23,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.8,
                        )),
                    child: InkWell(
                      onDoubleTap: (){
                            final String amt="649";

                            _razorpay.open(
                                    {'key': 'rzp_test_1DP5mmolF5G5ag',
      'amount': amt,}
                            );
                      },
                      child: Tab(
                        child: Container(
                          margin: EdgeInsets.only(top: 16, right: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Premium",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "4K + HDR",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // height: 20,
                      ),
                    ),
                  ), // First tab
                  Container(
        
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    width: MediaQuery.sizeOf(context).width * 0.23,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.8,
                        )),
                    child: Tab(
                      child: Container(
                        margin: EdgeInsets.only(top: 16, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Standard",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "1080p",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // height: 20,
                    ),
                  ), // Second tab
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    width: MediaQuery.sizeOf(context).width * 0.23,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.8,
                        )),
                    child: Tab(
                      child: Container(
                        margin: EdgeInsets.only(top: 17, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Basic",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "720p",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // height: 20,
                    ),
                  ), // Third tab
        
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.13,
                    width: MediaQuery.sizeOf(context).width * 0.23,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.8,
                        )),
                    child: Tab(
                      child: Container(
                        margin: EdgeInsets.only(top: 16, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mobile",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "480p",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // height: 20,
                    ),
                  ), // Fourth tab
                ],
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top:10.0,left: 1.5,right: 1.5),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Contents of the first tab
                      Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Monthly price"),
                               Row(
                                children: [
                                  Icon
                                  (
                                    Icons.currency_rupee,color: Colors.white,size: 21,),
                                  Text(
                                "649",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                                ],
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Video and sound "),
                                  Text("quality")
                                ],
                              ),
                              Text("Best",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Resolution"),
                              Text("4K (Ultra HD) + HDR",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Spatial audio"),
                                  Text("(Immersive sound)")
                                ],
                              ),
                              Text("Included",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Supported devices"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("TV,computer,mobile phone,",
                                      style: TextStyle(
                                        fontSize: 16.5,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  Text("tablet",
                                      style: TextStyle(
                                        fontSize: 16.5,

                                          color: Colors.white,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Devices your household"),
                                  Text("can watch at the same"),
                                  Text("time")
                                ],
                              ),
                              Text("4",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Download Devices"),
                              Text("6",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HD (720p), Full HD (1080p), Ultra HD (4K) and HDR",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                    "availability subject to your internet service and device ",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                    "capabilities. Not all content is available in all resolutions. See",
                                    style: TextStyle(fontSize: 12)),
                                Text("our Terms of Use for more details.",
                                    style: TextStyle(fontSize: 12)),
                                                    
                            SizedBox(height: 30,),
                                        
                                                 Column(
                                                       children: [
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
                                             controller: amt1,
                                             validator: (value) {
                                               if (value == null || value.isEmpty) {
                                                 return 'Please enter Amount to be paid';
                                               }
                                               return null;
                                             },
                                           ),
                                            Container(
                            
                                                margin: EdgeInsets.only(top: 20),
                                                width: MediaQuery.sizeOf(context).width*0.9,
                                                height: MediaQuery.sizeOf(context).height*0.06,
                                              
                                                child: 
                                              
                                                
                                                TextButton(
                            
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFE0202),
                                foregroundColor: Color(0xFFE6E6E6),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)))),
                            child: const Text(
                              "PAY NOW",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 25),
                            ),
                            onPressed:(){ _razorpay.open({
                                                  "key": "rzp_test_atVo36MIyOX9bQ",
                                                "amount":"64900"
                                                });},
                                                    )
                                                 )
                                                       ],
                                                     ),    
                              ],
                            
                            ),
                          ),
                        ],
                      )),
                      // Contents of the second tab
                     Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Monthly price",style: TextStyle(color: Colors.white),),
                           
                              Row(
                                children: [
                                  Icon
                                  (
                                    Icons.currency_rupee,color: Colors.white,size: 21,),
                                  Text(
                                "499",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                                ],
                              )

                              // Text(
                              //   "₹499",
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.w600),
                              // ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Video and sound "),
                                  Text("quality")
                                ],
                              ),
                              Text("Great",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Resolution"),
                              Text("4K (Ultra HD) + HDR",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Spatial audio"),
                                  Text("(Immersive sound)")
                                ],
                              ),
                              Text("Included",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Supported devices"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("TV,computer,mobile phone,",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  Text("tablet",
                                      style: TextStyle(
                                        fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Devices your household"),
                                  Text("can watch at the same"),
                                  Text("time")
                                ],
                              ),
                              Text("2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Download Devices"),
                              Text("2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HD (720p), Full HD (1080p), Ultra HD (4K) and HDR",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                    "availability subject to your internet service and device ",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                    "capabilities. Not all content is available in all resolutions. See",
                                    style: TextStyle(fontSize: 12)),
                                Text("our Terms of Use for more details.",
                                    style: TextStyle(fontSize: 12)),
                                              
                                SizedBox(height: 30,),
                                            
                     Column(
                           children: [
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
                                                 controller: amt2,
                                                 validator: (value) {
                                                   if (value == null || value.isEmpty) {
                                                     return 'Please enter Amount to be paid';
                                                   }
                                                   return null;
                                                 },
                                               ),
                                                Container(

                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.sizeOf(context).width*0.9,
                    height: MediaQuery.sizeOf(context).height*0.06,
                  
                    child: 
                  
                    
                    TextButton(

                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFFE0202),
                                    foregroundColor: Color(0xFFE6E6E6),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                                child: const Text(
                                  "PAY NOW",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 25),
                                ),
                                onPressed:(){ _razorpay.open({
                      "key": "rzp_test_atVo36MIyOX9bQ",
                    "amount":"49900"
                    });},
                        )
                     )
                           ],
                         ),            
                              ],
                            
                            ),
                          ),
                        ],
                      )),
                      // Contents of the third tab
                      Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Monthly price"),
                                 Row(
                                children: [
                                  Icon
                                  (
                                    Icons.currency_rupee,color: Colors.white,size: 21,),
                                  Text(
                                "199",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                                ],
                              )
                              // Text(
                              //   "₹199",
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.w600),
                              // ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Video and sound "),
                                  Text("quality")
                                ],
                              ),
                              Text("Good",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Resolution"),
                              Text("720p (HD)",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Spatial audio"),
                                  Text("(Immersive sound)")
                                ],
                              ),
                              Text("Included",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Supported devices"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("TV,computer,mobile phone,",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  Text("tablet",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Devices your household"),
                                  Text("can watch at the same"),
                                  Text("time")
                                ],
                              ),
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Download Devices"),
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HD (720p), Full HD (1080p), Ultra HD (4K) and HDR",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                    "availability subject to your internet service and device ",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                    "capabilities. Not all content is available in all resolutions. See",
                                    style: TextStyle(fontSize: 12)),
                                Text("our Terms of Use for more details.",
                                    style: TextStyle(fontSize: 12)),


                                        
                                SizedBox(height: 30,),
                                            
                     Column(
                           children: [
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
                                                 controller: amt3,
                                                 validator: (value) {
                                                   if (value == null || value.isEmpty) {
                                                     return 'Please enter Amount to be paid';
                                                   }
                                                   return null;
                                                 },
                                               ),
                                                Container(

                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.sizeOf(context).width*0.9,
                    height: MediaQuery.sizeOf(context).height*0.06,
                  
                    child: 
                  
                    
                    TextButton(

                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFFE0202),
                                    foregroundColor: Color(0xFFE6E6E6),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                                child: const Text(
                                  "PAY NOW",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 25),
                                ),
                                onPressed:(){ _razorpay.open({
                      "key": "rzp_test_atVo36MIyOX9bQ",
                    "amount":"19900"
                    });},
                        )
                     )
                           ],
                         ),    
                              ],
                            
                            ),
                          ),
                        ],
                      )),
                      // Contents of the fourth tab
                    Center(
                          child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Monthly price"),
                              Row(
                                children: [
                                  Icon
                                  (
                                    Icons.currency_rupee,color: Colors.white,size: 21,),
                                  Text(
                                "149",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                                ],
                              )

                              // Text(
                              //   "₹ 149",
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.w600),
                              // ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Video and sound "),
                                  Text("quality")
                                ],
                              ),
                              Text("Fair",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Resolution"),
                              Text("480p",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Spatial audio"),
                                  Text("(Immersive sound)")
                                ],
                              ),
                              Text("Included",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Supported devices"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Mobile phone,tablet",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.5,
                                          fontWeight: FontWeight.w600)),
        
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Devices your household"),
                                  Text("can watch at the same"),
                                  Text("time")
                                ],
                              ),
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Download Devices"),
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HD (720p), Full HD (1080p), Ultra HD (4K) and HDR",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                    "availability subject to your internet service and device ",
                                    style: TextStyle(fontSize: 12)),
                                Text(
                                    "capabilities. Not all content is available in all resolutions. See",
                                    style: TextStyle(fontSize: 12)),
                                Text("our Terms of Use for more details.",
                                    style: TextStyle(fontSize: 12)),
                                
                                SizedBox(height: 30,),
                                            
                     Column(
                           children: [
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
                                                 controller: amt4,
                                                 validator: (value) {
                                                   if (value == null || value.isEmpty) {
                                                     return 'Please enter Amount to be paid';
                                                   }
                                                   return null;
                                                 },
                                               ),
                                                Container(

                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.sizeOf(context).width*0.9,
                    height: MediaQuery.sizeOf(context).height*0.06,
                  
                    child: 
                  
                    
                    TextButton(

                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFFE0202),
                                    foregroundColor: Color(0xFFE6E6E6),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                                child: const Text(
                                  "PAY NOW",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 25),
                                ),
                                onPressed:(){ _razorpay.open({
                      "key": "rzp_test_atVo36MIyOX9bQ",
                    "amount":"14900"
                    });},
                        )
                     )
                           ],
                         ),      
                              ],
                            
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),]
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

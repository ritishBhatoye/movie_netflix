import 'package:flutter/material.dart';

class NewNHotScreen extends StatelessWidget {
  const NewNHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "New & Hot",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  child: InkWell(
                    onTap: (){
                      
                    },
                    child: Image.asset(
                      "assets/New&Hot/screencast.png",
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  child: Image.asset(
                    "assets/New&Hot/search.png",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text("New & Hot"),
        ),
      ),
    );
  }
}

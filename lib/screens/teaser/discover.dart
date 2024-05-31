import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone/screens/teaser/LiveStreaming.dart';
// import 'package:netflix_clone/screens/teaser/LiveStreaming.dart';
import 'package:netflix_clone/screens/teaser/teaser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/widgets/news_widget.dart';
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'Discover',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 28,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: "    Teaser 🌶️  ",
                ),
                Tab(
                  text: "    LIVE   🔴 ",
                ),
                Tab(
                  text: "    News   📰 ",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                child:
                    // Text("hi")
                    Teaser(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: LiveScreen()),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: NewsScreen()),
              ),
              // SingleChildScrollView(
              //   child: Column(
              //     children: [
              //         Text(""),
              //     ],
              //   ),
              // ),
              // SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       // Content for the fourth tab
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

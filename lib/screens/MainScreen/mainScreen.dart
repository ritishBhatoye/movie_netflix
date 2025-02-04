import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netflix_clone/widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BottomNavBar(),
      ),
    );
  }
}

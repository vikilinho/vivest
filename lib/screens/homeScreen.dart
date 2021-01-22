import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2428),
      body: Container(
        child: Center(
            child: Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

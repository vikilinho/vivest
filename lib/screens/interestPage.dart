import 'package:flutter/material.dart';

class InterestPage extends StatefulWidget {
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "interest Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

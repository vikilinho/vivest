import 'package:flutter/material.dart';

class FinanceNews extends StatefulWidget {
  @override
  _FinanceNewsState createState() => _FinanceNewsState();
}

class _FinanceNewsState extends State<FinanceNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Finance News",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

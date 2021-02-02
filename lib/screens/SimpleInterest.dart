import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investo/constants/container.dart';

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  int initialBalance = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(
                FontAwesomeIcons.dollarSign,
                size: 16.0,
                color: Colors.white,
              ),
              labelText: "Initial Deposit:",
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              focusColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

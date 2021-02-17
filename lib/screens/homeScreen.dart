import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool _light = true;

class HomeScreen extends StatefulWidget {
  final bool _light = true;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2428),
      appBar: AppBar(
        leading: Switch(
            value: _light,
            onChanged: (toggle) {
              setState(() {
                _light = toggle;
              });
            }),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/MoniMata.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  " It's your Money \n        Manage it better.",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Chains of habit are too light to be felt until they are too heavy to be broken - Warren Buffett",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

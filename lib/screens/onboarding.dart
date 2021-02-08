import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        decoration: PageDecoration(
          imagePadding: EdgeInsets.all(20),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),
          pageColor: Colors.cyan[900],
        ),
        image: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Image(
            image: AssetImage("images/liveMarket.png"),
          ),
        ),
        title: "Stock Market Updates",
        bodyWidget: Icon(
          FontAwesomeIcons.chartBar,
          color: Colors.white,
          size: 50,
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),
          pageColor: Colors.cyan[900],
        ),
        image: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Image(image: AssetImage("images/calculate.png")),
        ),
        title: "Finanacial Calculators",
        bodyWidget: Icon(
          FontAwesomeIcons.calculator,
          color: Colors.white,
          size: 50,
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50.0),
            pageColor: Colors.cyan[900]),
        image: Padding(
          padding: EdgeInsets.only(top: 30, left: 25, right: 25),
          child: Image(
            image: AssetImage("images/finance.png"),
          ),
        ),
        title: "Financial Education",
        bodyWidget: Icon(
          FontAwesomeIcons.school,
          color: Colors.white,
          size: 50,
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),
          pageColor: Colors.cyan[900],
        ),
        image: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Image(image: AssetImage("images/reading.png")),
        ),
        title: "Latest Financial News",
        bodyWidget: Icon(
          FontAwesomeIcons.tv,
          color: Colors.white,
          size: 50,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: IntroductionScreen(
              done: Text(
                "Done",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              pages: getPages(),
              onDone: () {
                Navigator.pushNamed(context, "NavigationScreen");
              },
              globalBackgroundColor: Colors.white10),
        ),
      ),
    );
  }
}

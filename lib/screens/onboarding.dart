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
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),
          pageColor: Colors.teal,
        ),
        image: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Image(
            image: AssetImage("images/liveMarket.png"),
          ),
        ),
        title: "Live Market Updates",
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
          pageColor: Colors.teal,
        ),
        image: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Image(image: AssetImage("images/calculate.png")),
        ),
        title: "Interest Calculator",
        bodyWidget: Icon(
          FontAwesomeIcons.calculator,
          color: Colors.white,
          size: 50,
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),
          pageColor: Colors.teal,
        ),
        image: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Image(image: AssetImage("images/keepcharge.png")),
        ),
        title: "Track your Investment Portfolio",
        bodyWidget: Icon(
          FontAwesomeIcons.shoppingBag,
          color: Colors.white,
          size: 50,
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),
          pageColor: Colors.teal,
        ),
        image: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Image(image: AssetImage("images/latestnews.png")),
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
            globalBackgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

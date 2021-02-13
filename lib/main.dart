import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:investo/screens/homeScreen.dart';
import 'package:investo/screens/navigationScreen.dart';
import 'package:investo/screens/onboarding.dart';

import 'package:investo/screens/splashScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xff1F2428),
        primarySwatch: Colors.teal,
        primaryColorDark: Color(0xff1F2428),
        primaryColorLight: Color(0xffFFFFFF),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: "splashScreen",
      routes: {
        "splashScreen": (ctx) => SplashScreen(),
        "homeScreen": (ctx) => HomeScreen(),
        "onboarding": (ctx) => OnboardScreen(),
        "NavigationScreen": (ctx) => NavigationScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:investo/screens/homeScreen.dart';
import 'package:investo/screens/onboarding.dart';
import 'package:investo/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:"homeScreen",
      routes: {
        "splashScreen": (ctx) => SplashScreen(),
        "homeScreen": (ctx) => HomeScreen(),
        "onboarding": (ctx) => OnboardScreen()
      },
    );
  }
}

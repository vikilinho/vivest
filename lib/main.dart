import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:investo/screens/homeScreen.dart';
import 'package:investo/screens/navigationScreen.dart';

import 'package:investo/screens/splashScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document =
      await getApplicationDocumentsDirectory(); //getting the path
  Hive.init(document.path); //initialising the hive database
  await Hive.openBox<dynamic>("Expense"); //opening of the box

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
        "NavigationScreen": (ctx) => NavigationScreen(),
      },
    );
  }
}

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:investo/model/trans.dart';

import 'package:investo/screens/homeScreen.dart';
import 'package:investo/screens/navigationScreen.dart';

import 'package:investo/screens/splashScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:investo/screens/homeScreen.dart';

const String TransactionBoxName = "transaction";
bool _light = false;

Box<Trans> expenseBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document =
      await getApplicationDocumentsDirectory(); //getting the path
  Hive.init(document.path); //initialising the hive database
  Hive.registerAdapter(TransAdapter());
  await Hive.openBox<Trans>(TransactionBoxName); //opening of the box

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData _darkTheme = ThemeData(
    unselectedWidgetColor: Colors.white,
    selectedRowColor: Colors.teal[200],
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.black45,
    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.white),
        headline5: TextStyle(
          color: Colors.white,
        )),
    primaryColorDark: Color(0xff1F2428),
  );

  ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    selectedRowColor: Colors.teal[600],
    unselectedWidgetColor: Colors.black54,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.black45,
    primaryColorDark: Color(0xff1F2428),
    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.black),
        headline5: TextStyle(
          color: Colors.black,
        )),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _light ? _lightTheme : _darkTheme,
      initialRoute: "splashScreen",
      routes: {
        "splashScreen": (ctx) => SplashScreen(),
        "homeScreen": (ctx) => HomeScreen(),
        "NavigationScreen": (ctx) => NavigationScreen(),
      },
    );
  }
}

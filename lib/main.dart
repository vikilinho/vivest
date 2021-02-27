import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:investo/constants/themeController.dart';
import 'package:investo/model/expense.dart';

import 'package:investo/screens/homeScreen.dart';
import 'package:investo/screens/navigationScreen.dart';

import 'package:investo/screens/splashScreen.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';

const String ExpenseBoxName = "expense";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.openBox<ExpenseModel>(ExpenseBoxName);
  Hive.registerAdapter(ExpenseModelAdapter());

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: MyApp(),
    ),
  );
}
//
// ChangeNotifierProvider(
// ,

class MyApp extends StatelessWidget {
  ThemeData _darkTheme = ThemeData(
    buttonColor: Colors.white,
    unselectedWidgetColor: Colors.white,
    selectedRowColor: Colors.teal[200],
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.black,
    bottomAppBarColor: Colors.black,

    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.white),
        headline5: TextStyle(
          color: Colors.white,
        )),
    // primaryColorDark: Color(0xff1F2428),
  );

  ThemeData _lightTheme = ThemeData(
    buttonColor: Colors.black87,
    brightness: Brightness.light,
    selectedRowColor: Colors.teal[600],
    unselectedWidgetColor: Colors.black,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.black45,
    bottomAppBarColor: Colors.white,
    primaryColorDark: Color(0xff1F2428),
    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.black),
        headline5: TextStyle(
          color: Colors.black,
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
        builder: (context, themeController, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.isDarkMode ? _lightTheme : _darkTheme,
        initialRoute: "splashScreen",
        routes: {
          "splashScreen": (ctx) => SplashScreen(),
          "homeScreen": (ctx) => HomeScreen(),
          "NavigationScreen": (ctx) => NavigationScreen(),
        },
      );
    });
  }
}

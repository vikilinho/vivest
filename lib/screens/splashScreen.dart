import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investo/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => OnboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white12,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.0,
              0.5,
            ],
            colors: [
              // Color(0xff96c93d),
              // Color(0xFF00b09b),
              //2
              // Color(0xff06beb6),
              // Color(0xff48b1bf),
              //3

              // Color(0xffC6426E),
              // Color(0xff642B73),
              //4

              // Color(0xfff2fcfe),
              // Color(0xff1c92d2),
              //5

              Color(0xff36D1DC),
              Color(0xff5B86E5),
              //6
              // Color(0xff283c86),
              // Color(0xff45a247),
            ],
            //  Color(0xff96c93d),
            //   Color(0xFF00b09b),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image(image: AssetImage("images/MoniMata.png")),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image(image: AssetImage("images/liveMarket.png")),
          title: "Live Market Updates",
          bodyWidget: Icon(Icons.money)),
      PageViewModel(
          image: Image(image: AssetImage("images/calculate.png")),
          title: "Interest Calculator",
          bodyWidget: Icon(Icons.calculate)),
      PageViewModel(
          image: Image(image: AssetImage("images/keepcharge.png")),
          title: "Track your Investment Portfolio",
          bodyWidget: Icon(Icons.account_box)),
      PageViewModel(
          image: Image(image: AssetImage("images/latestnews.png")),
          title: "Latest Financial News",
          bodyWidget: Icon(Icons.tv_rounded)),
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
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            pages: getPages(),
            onDone: () {},
            globalBackgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

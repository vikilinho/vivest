import 'package:flutter/material.dart';
import 'package:investo/screens/financeNews.dart';

import 'package:investo/screens/interestPage.dart';
import 'package:investo/screens/liveMarket.dart';
import 'package:investo/screens/onboarding.dart';
import 'package:investo/screens/splashScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  set currentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            // FinanceNews(),
            LiveMarket(),
            HomeScreen(),
            InterestPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => currentIndex = index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "Calculate"),
            BottomNavigationBarItem(
                icon: Icon(Icons.read_more), label: " Finance News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: "Market Updates"),
          ],
        ));
  }
}

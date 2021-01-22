import 'package:flutter/material.dart';
import 'package:investo/screens/financeNews.dart';
import 'package:investo/screens/homeScreen.dart';
import 'package:investo/screens/interestPage.dart';
import 'package:investo/screens/liveMarket.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
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
            HomeScreen(),
            InterestPage(),
            FinanceNews(),
            LiveMarket(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => currentIndex = index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.calculate),
                label: "Calculate"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blueGrey,
                icon: Icon(Icons.read_more),
                label: " Finance News"),
            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                icon: Icon(Icons.business),
                label: "Market Updates"),
          ],
        ));
  }
}

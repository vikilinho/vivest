import 'package:flutter/material.dart';

import 'package:investo/screens/expenseTracker.dart';
import 'package:investo/screens/financeNews.dart';
import 'package:investo/screens/homeScreen.dart';
import 'package:investo/screens/InterestTab1.dart';

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
            InterestPageTab(),
            FinanceNews(),
            ExpenseTracker(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).bottomAppBarColor,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          selectedItemColor: Theme.of(context).selectedRowColor,
          unselectedLabelStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => currentIndex = index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "Calculator"),
            BottomNavigationBarItem(
                icon: Icon(Icons.read_more), label: " Finance News"),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: " Expense \n  Tracker",
            ),
          ],
        ));
  }
}

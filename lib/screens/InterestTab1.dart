import 'package:flutter/material.dart';
import 'package:investo/screens/compoundinterest.dart';
import 'package:investo/screens/SimpleInterest.dart';

class InterestPageTab extends StatefulWidget {
  @override
  _InterestPageTabState createState() => _InterestPageTabState();
}

class _InterestPageTabState extends State<InterestPageTab>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 0;
  set currentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> list = [
    Tab(
      text: 'Simple Interest',
    ),
    Tab(
      text: 'Compound Interest',
    ),
  ];
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      _currentIndex = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          labelPadding: EdgeInsets.all(8.0),
          indicatorColor: Colors.white,
          onTap: (index) => currentIndex = index,
          controller: _controller,
          tabs: list,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [SimpleInterest(), CompoundInterest()],
      ),
    );
  }
}

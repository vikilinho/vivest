import 'package:flutter/material.dart';

class LiveMarket extends StatefulWidget {
  @override
  _LiveMarketState createState() => _LiveMarketState();
}

class _LiveMarketState extends State<LiveMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Live Market Upadate ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

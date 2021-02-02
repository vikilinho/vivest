import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompoundInterest extends StatefulWidget {
  @override
  _CompoundInterestState createState() => _CompoundInterestState();
}

class _CompoundInterestState extends State<CompoundInterest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Compound Interest",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investo/calculatorBox.dart';
import 'package:investo/screens/resultScreen.dart';

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  String dropdownValue = 'Year ';
  int amount = 20;
  int rate = 10;
  int time = 2;
  final contrAmount = TextEditingController();
  final contrRate = TextEditingController();
  final contrTime = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    contrAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: contrAmount,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(245, 247, 251, 1),
                      )),
                      prefixIcon: Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16.0,
                        color: Colors.white,
                      ),
                      labelText: "Amount:",
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: contrRate,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(245, 247, 251, 1),
                      )),
                      prefixIcon: Icon(
                        FontAwesomeIcons.percent,
                        size: 16.0,
                        color: Colors.white,
                      ),
                      labelText: "Interest Rate Per:",
                      suffixText: "$dropdownValue",
                      suffixStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.teal,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  focusColor: Colors.teal,
                  hint: Text(
                    'Year',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  items: <String>[
                    ' Years',
                    ' Months',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: contrTime,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromRGBO(245, 247, 251, 1),
                      )),
                      prefixIcon: Icon(
                        FontAwesomeIcons.clock,
                        size: 16.0,
                        color: Colors.white,
                      ),
                      labelText: 'Number of $dropdownValue:',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ButtonTheme(
                  minWidth: 400,
                  height: 60,
                  child: RaisedButton(
                    child: Text("Calculate Interest",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.teal,
                    //Color.fromRGBO(28, 180, 174, 1),
                    onPressed: () {
                      CalculatorBox calc =
                          CalculatorBox(amount: amount, rate: rate, time: time);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  simpleInterest: calc.calculateSI(),
                                  total: calc.result(),
                                )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

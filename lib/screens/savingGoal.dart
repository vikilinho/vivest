import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SavingGoal extends StatefulWidget {
  @override
  _SavingGoalState createState() => _SavingGoalState();
}

class _SavingGoalState extends State<SavingGoal> {
  String compoundingValue = 'Annually';
  String dropdownValue = 'Year ';
  int _value = 1;

  int amount = 2000;
  int rate = 10;
  int time = 2;

  final savingTarget = TextEditingController();
  final contrRate = TextEditingController();
  final contrTime = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    savingTarget.dispose();
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
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (newvalue) {
                      setState(() {
                        newvalue = savingTarget.text;
                        amount = newvalue as int;
                      });
                    },
                    controller: savingTarget,
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
                      labelText: " Saving Target:",
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
                    onChanged: (newvalue) {
                      setState(() {
                        newvalue = contrRate.text;
                        rate = newvalue as int;
                      });
                    },
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
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (newvalue) {
                      setState(() {
                        newvalue = contrTime.text;
                        time = newvalue as int;
                      });
                    },
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
                      labelText: 'Number of $dropdownValue to grow:',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: [
                  Text(
                    "Compounding Frequency",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "Annually",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Semi-annually",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Monthly",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          value: 12,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ButtonTheme(
                  minWidth: 400,
                  height: 60,
                  child: RaisedButton(
                    child: Text("Calculate Saving Goal",
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
                      var target = double.parse(savingTarget.text);

                      var tme = int.parse(contrTime.text);
                      var rt = double.parse(contrRate.text);
                      var nrt = rt * 0.01;
                      var top = target * ((nrt) / _value);
                      print(top);
                      var ftop = pow(nrt / _value, tme * _value);
                      //my problem
                      print(ftop);
                      var bottom = 1 + ftop - 1;
                      print(bottom);
                      var saving = top / bottom;
                      var monthlySaving = saving.toStringAsFixed(2);

                      return showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AlertDialog(
                              backgroundColor: Colors.black87,
                              elevation: 0.0,
                              contentTextStyle: TextStyle(color: Colors.white),
                              title: Text(r"To reach your saving target of $"
                                  "$target,"),
                              content: Text(
                                r"You will have save $"
                                "$monthlySaving every month",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  String dropdownValue = 'Year ';
  int amount = 2000;
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
                    onChanged: (newvalue) {
                      setState(() {
                        newvalue = contrAmount.text;
                        amount = newvalue as int;
                      });
                    },
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
              SizedBox(height: 25),
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
                      var amnt = double.parse(contrAmount.text);
                      var tme = int.parse(contrTime.text);
                      var rt = double.parse(contrRate.text);
                      print(amnt);
                      print(tme);
                      print(rt);

                      var si = (amnt * tme * rt) / 100;

                      var tt = si + amnt;

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
                              title: Text(r"Interest acrued is $" "$si."),
                              content: Text(
                                r"Total amount is $"
                                "$tt  in $tme $dropdownValue ",
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

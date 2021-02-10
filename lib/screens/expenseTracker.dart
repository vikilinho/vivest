import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investo/screens/new_transaction.dart';
import 'package:investo/screens/transaction_list.dart';
import 'package:investo/screens/userTransaction.dart';

class ExpenseTracker extends StatefulWidget {
  @override
  _ExpenseTrackerState createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                elevation: 5,
                color: Colors.teal,
                child: Text(
                  "Chart is here",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}

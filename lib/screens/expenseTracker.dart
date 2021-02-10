import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investo/screens/new_transaction.dart';
import 'package:investo/screens/transaction_list.dart';

import 'package:investo/transaction.dart';

class ExpenseTracker extends StatefulWidget {
  @override
  _ExpenseTrackerState createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Transaction> userTransactions = [];
  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      userTransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.black87,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(
            addTx: _addTransaction,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              TransactionList(transactions: userTransactions)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Expense",
        backgroundColor: Colors.teal,
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          onPressed: () => _startNewTransaction(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

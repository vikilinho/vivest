import 'package:flutter/material.dart';
import 'package:investo/screens/new_transaction.dart';
import 'package:investo/screens/transaction_list.dart';
import 'package:investo/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTx: _addTransaction),
        TransactionList(transactions: userTransactions),
      ],
    );
  }
}

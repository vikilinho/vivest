import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:investo/transaction.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  " Click below to add your expense",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 200,
                  child: SvgPicture.asset(
                    'images/bike.svg',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 30, color: Colors.teal),
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.teal, width: 2),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

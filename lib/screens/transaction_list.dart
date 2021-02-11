import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:investo/transaction.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

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
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(0)}',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: Icon(FontAwesomeIcons.trash, color: Colors.red),
                        onPressed: () => deleteTx(transactions[index].id),
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

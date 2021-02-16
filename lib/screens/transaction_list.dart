import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:investo/model/trans.dart';

class TransactionList extends StatefulWidget {
  final List<Trans> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {

  Box<Trans> expenseBox;

  @override
  void initState() {

    super.initState();
    expenseBox = Hive.box<Trans>('ExpenseBox');

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      child: widget.transactions.isEmpty
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
          : ValueListenableBuilder(
        valueListenable: expenseBox.listenable();
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 5,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            ),
    );
  }
}

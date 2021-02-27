import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:investo/model/expense.dart';

const String ExpenseBoxName = "expense";

class TransactionList extends StatefulWidget {
  final List<ExpenseModel> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Box<ExpenseModel> transBox;

  @override
  void initState() {
    transBox = Hive.box<ExpenseModel>(ExpenseBoxName);
    super.initState();
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
              valueListenable: transBox.listenable(),
              builder: (context, Box<ExpenseModel> items, _) {
                List<int> keys;
                keys = items.keys.cast<int>().toList();
                return ListView.separated(
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: keys.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    final int key = keys[index];
                    final ExpenseModel data = items.get(key);

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
                                  '\$${data.amount.toStringAsFixed(0)}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            data.title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd().format(data.date),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          trailing: IconButton(
                            icon:
                                Icon(FontAwesomeIcons.trash, color: Colors.red),
                            onPressed: () =>
                                widget.deleteTx(widget.transactions[index].id),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
    );
  }
}

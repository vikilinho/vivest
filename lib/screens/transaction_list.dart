import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investo/main.dart';
import 'package:investo/model/trans.dart';

class TransactionList extends StatefulWidget {
  final List<Trans> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Box<Trans> transactionBox;

  @override
  void initState() {
    transactionBox = Hive.box<Trans>(TransactionBoxName);
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
              valueListenable: transactionBox.listenable(),
              builder: (context, Box<Trans> trans, _) {
                return ListView.builder(
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
                                  '\$${widget.transactions[index].amount.toStringAsFixed(0)}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            widget.transactions[index].title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd()
                                .format(widget.transactions[index].date),
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
                  itemCount: widget.transactions.length,
                );
              }),
    );
  }
}

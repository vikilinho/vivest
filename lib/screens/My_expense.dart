import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:investo/main.dart';
import 'package:investo/model/expense.dart';
import 'package:investo/screens/chart.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyExpense extends StatefulWidget {
  @override
  _MyExpenseState createState() => _MyExpenseState();
}

class _MyExpenseState extends State<MyExpense> {
  Box<ExpenseModel> expenseBox;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime _selectedDate;
  final List<ExpenseModel> userTransactions = [];
  List<ExpenseModel> get _recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    expenseBox = Hive.box<ExpenseModel>(ExpenseBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Chart(_recentTransactions),
              ValueListenableBuilder(
                  valueListenable: expenseBox.listenable(),
                  builder: (context, Box<ExpenseModel> items, _) {
                    List<int> keys;
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        final int key = keys[index];
                        final ExpenseModel data = items.get(key);

                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
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
                                  icon: Icon(FontAwesomeIcons.trash,
                                      color: Colors.red),
                                  onPressed: () {}),
                            ),
                          ),
                        );
                      },
                      itemCount: keys.length,
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Expense",
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.black87,
                context: context,
                builder: (_) {
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, right: 20, left: 20, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: titleController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Color.fromRGBO(245, 247, 251, 1),
                                )),
                                labelText: "Title",
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromRGBO(245, 247, 251, 1),
                                  )),
                                  labelText: "Amount",
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  prefix: Text(
                                    '\$',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  _selectedDate == null
                                      ? "No date picked"
                                      : " Selected Date: ${DateFormat.yMd().format(_selectedDate)}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextButton(
                                  child: Text(
                                    "Select Date",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: _showDatePicker,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: ButtonTheme(
                            minWidth: 150,
                            height: 50,
                            child: RaisedButton(
                                child: Text("Add Transaction",
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
                                  final title = titleController.text;
                                  final amount =
                                      double.parse(amountController.text);
                                  ExpenseModel mdata = ExpenseModel(
                                    amount: amount,
                                    title: title,
                                    date: _selectedDate,
                                  );
                                  expenseBox.add(mdata);
                                }),
                          ),
                        ),
                      ],
                    ),
                    behavior: HitTestBehavior.opaque,
                  );
                });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

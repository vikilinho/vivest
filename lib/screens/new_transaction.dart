import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:investo/model/expense.dart';

const String ExpenseBoxName = "expense";

class NewTransaction extends StatefulWidget {
  // making a reference of the box
  final Function addTx;

  NewTransaction({this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _cntroller = TextEditingController();
  DateTime _selectedDate;
  Box<ExpenseModel> transactionBox;

  // void _sendToHive() {
  //   final transactionBox = Hive.box("ExpenseBox");
  //   final enteredTitle = _controller.text;
  //   final enteredAmount = double.parse(_cntroller.text);
  //   Trans trans =
  //       Trans(title: enteredTitle, amount: enteredAmount, date: _selectedDate);
  //   transactionBox.add(trans);
  //   print(transactionBox.add(trans));
  //
  //   print("I am here");
  //   widget.addTx(enteredTitle, enteredAmount, _selectedDate);
  //   Navigator.of(context).pop();
  // }

  void _submitData() {
    if (_selectedDate == null) {
      return;
    }

    final enteredTitle = _controller.text;
    final enteredAmount = double.parse(_cntroller.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
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
    transactionBox = Hive.box<ExpenseModel>(ExpenseBoxName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _controller,
                onSubmitted: (ctx) => _submitData,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(245, 247, 251, 1),
                  )),
                  labelText: "Title",
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
                controller: _cntroller,
                keyboardType: TextInputType.number,
                onSubmitted: (ctx) => _submitData,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(245, 247, 251, 1),
                    )),
                    labelText: "Amount",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                    final title = _controller.text;
                    final enteredAmount = double.parse(_cntroller.text);
                    ExpenseModel data = ExpenseModel(
                        amount: enteredAmount,
                        title: title,
                        date: _selectedDate);
                    transactionBox.add(data);
                    widget.addTx(title, enteredAmount, _selectedDate);
                    Navigator.of(context).pop();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _cntroller = TextEditingController();
  final Function addTx;

  NewTransaction({this.addTx});
  void _submitData() {
    final enteredTitle = _controller.text;
    final enteredAmount = double.parse(_cntroller.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                onPressed: _submitData),
          ),
        ),
      ],
    );
  }
}

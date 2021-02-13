import 'package:flutter/material.dart';

class Trans {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Trans(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
  Trans.withId({this.id, this.title, this.amount, this.date});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    return {
      map['id']: id,
      map['title']: title,
      map['amount']: amount,
      map['date']: date.toString(),
    };
  }

  factory Trans.fromMap(Map<String, dynamic> map) {
    return Trans.withId(
        id: map['id'],
        title: map['title'],
        amount: map['amount'],
        date: map['date']);
  }
}

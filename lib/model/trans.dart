import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'trans.g.dart';

@HiveType(typeId: 0)
class Trans {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;

  Trans(
      {this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}

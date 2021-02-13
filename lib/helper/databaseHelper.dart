import 'dart:io';

import 'package:investo/transaction.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  static Database _db;

  DataBaseHelper._instance();

  String expenseTable = 'expense_Table';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "expense_list.db";
    final expenseListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return expenseListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $expenseTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getExpenseMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(expenseTable);
    return result;
  }

  Future<List<Trans>> gettransactionList() async {
    final List<Map<String, dynamic>> taskMapList = await getExpenseMapList();
    final List<Trans> transactionList = [];
    taskMapList.forEach((taskMap) {
      transactionList.add(Trans.fromMap(taskMap));
    });
    return transactionList;
  }

  Future<int> insertTrans(Trans trans) async {
    Database db = await this.db;
    final int result = await db.insert(expenseTable, trans.toMap());
    return result;
  }

  Future<int> updateTrans(Trans trans) async {
    Database db = await this.db;
    final int result = await db.update(expenseTable, trans.toMap());
    return result;
  }
}

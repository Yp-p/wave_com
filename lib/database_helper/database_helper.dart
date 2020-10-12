import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  database() async {
    final Future<Database> database=openDatabase(
      join(await getDatabasesPath(), 'wave_history_database38.db'),
      onCreate: (db, version) async{
        db.execute(
        "CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT, dateTime DATETIME, accountMoney NUM, cashMoney NUM, sendCom NUM, receiveCom NUM, sendMoney NUM, receiveMoney NUM, sendFee NUM)"
        );
      },
      version: 1,

    );
    return database;
  }

  Future<void> insertHistoryDatabase(Map history) async{
    final Database db=await database();
    await db.insert('history', history, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<HistoryDatabase>> getHistoryDatabase() async{
    final Database db=await database();
    final List<Map<String, dynamic>> maps=await db.query('history');
    return List.generate(
        maps.length,
            (index) => HistoryDatabase(
              id: maps[index]['id'],
              dateTime: maps[index]['dateTime'],
              accountMoney: maps[index]['accountMoney'],
              cashMoney: maps[index][ 'cashMoney'],
              sendCom: maps[index]['sendCom'],
              receiveCom: maps[index]['receiveCom'],
              sendMoney: maps[index][ 'sendMoney'],
              receiveMoney: maps[index]['receiveMoney'],
              sendFee: maps[index]['sendFee']
            ));
  }



}

class HistoryDatabase{
  final int id;
  final String dateTime;
  final num accountMoney;
  final num cashMoney;
  final num sendCom;
  final num receiveCom;
  final num sendMoney;
  final num receiveMoney;
  final num sendFee;

  HistoryDatabase({this.id,this.dateTime, this.accountMoney, this.cashMoney, this.sendCom, this.receiveCom, this.sendMoney, this.receiveMoney, this.sendFee});

  Map<String, dynamic> toMap(){
    return {
      'dateTime':dateTime,
      'accountMoney':accountMoney,
      'cashMoney':cashMoney,
      'sendCom' : sendCom,
      'receiveCom' : receiveCom,
      'sendMoney' :sendMoney,
      'receiveMoney' : receiveMoney,
      'sendFee' : sendFee
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'HistoryDatabase{dateTime: $dateTime, accountMoney:$accountMoney,cashMoney : $cashMoney, sendCom : $sendCom, receiveCom : $receiveCom, sendMoney : $sendMoney, receiveMoney:$receiveMoney, sendFee:$sendFee}';
  }
}
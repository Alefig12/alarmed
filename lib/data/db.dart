import 'dart:convert';

import 'package:alarmed/domain/entities/alarm.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'alarm.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE alarm (id INTEGER PRIMARY KEY, pillName TEXT, days TEXT, startDateTime TEXT, endDateTime TEXT, repeat INTEGER, quantity INTEGER, dose INTEGER, tone TEXT, volume REAL)");
    }, version: 1);
  }

  static Future<void> insert(Alarm alarm) async {
    Database db = await _openDB();

    await db.insert("alarm", alarm.toMap());
  }

  static Future<void> delete(int alarmID) async {
    Database db = await _openDB();

    await db.delete("alarm", where: "id = ?", whereArgs: [alarmID]);
  }

  static Future<void> deleteAllAlarms() async {
    Database db = await _openDB();

    await db.delete('alarm');
  }

  static Future<List<Alarm>> getAllAlarms() async {
    Database db = await _openDB();

    final List<Map<String, dynamic>> alarmsMap = await db.query("alarm");

    return List.generate(alarmsMap.length, (i) {
      return Alarm(
          id: alarmsMap[i]['id'],
          pillName: alarmsMap[i]['pillName'],
          days: jsonDecode(alarmsMap[i]['days']) as List<dynamic>,
          startDateTime: DateFormat('yyyy-MM-dd – HH:mm')
              .parse(alarmsMap[i]['startDateTime']),
          endDateTime: DateFormat('yyyy-MM-dd – HH:mm')
              .parse(alarmsMap[i]['endDateTime']),
          repeat: alarmsMap[i]['repeat'],
          quantity: alarmsMap[i]['quantity'],
          dose: alarmsMap[i]['dose'],
          tone: alarmsMap[i]['tone'],
          volume: alarmsMap[i]['volume']);
    });
  }
}

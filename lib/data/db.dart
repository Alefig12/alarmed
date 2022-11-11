import 'dart:convert';

import 'package:alarmed/domain/entities/alarm.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'alarm.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE alarm (id INTEGER PRIMARY KEY, pillName TEXT, days TEXT, startDateTime TEXT, endDateTime TEXT, repeat INTEGER, quantity INTEGER, dose INTEGER, tone TEXT, volume REAL)");
    }, version: 1);
  }

  Future<void> insert(Alarm alarm) async {
    Database db = await _openDB();

    await db.insert("alarm", alarm.toMap());
  }

  Future<void> delete(Alarm alarm) async {
    Database db = await _openDB();

    await db.delete("alarm", where: "id = ?", whereArgs: [alarm.id]);
  }

  Future<List<Alarm>> getAllAlarms(Alarm alarm) async {
    Database db = await _openDB();

    final List<Map<String, dynamic>> alarmsMap = await db.query("alarms");

    return List.generate(alarmsMap.length, (i) {
      return Alarm(
          id: alarmsMap[i]['id'],
          pillName: alarmsMap[i]['pillName'],
          days: jsonDecode(alarmsMap[i]['days']) as List<dynamic>,
          startDateTime: alarmsMap[i]['startDateTime'],
          endDateTime: alarmsMap[i]['endDateTime'],
          repeat: alarmsMap[i]['repeat'],
          quantity: alarmsMap[i]['quantity'],
          dose: alarmsMap[i]['dose'],
          tone: alarmsMap[i]['tone'],
          volume: alarmsMap[i]['volume']);
    });
  }
}

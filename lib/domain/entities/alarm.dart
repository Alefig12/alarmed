import 'package:meta/meta.dart';
import 'dart:convert';

class Alarm {
  int id;
  String pillName;
  List days;
  DateTime startDateTime;
  DateTime endDateTime;
  int repeat;
  int quantity;
  int dose;
  String? tone;
  double? volume;

  Alarm(
      {required this.id,
      required this.pillName,
      required this.days,
      required this.startDateTime,
      required this.endDateTime,
      required this.repeat,
      required this.quantity,
      required this.dose,
      this.tone,
      this.volume});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pillName': pillName,
      'days': jsonEncode(days),
      'startDateTime': startDateTime,
      'endDateTime': endDateTime,
      'repeat': repeat,
      'quantity': quantity,
      'dose': dose,
      'tone': tone,
      'volume': volume
    };
  }

  String getPillName() {
    return pillName;
  }

  DateTime getDate() {
    return startDateTime;
  }

  int getId() {
    return id;
  }
}

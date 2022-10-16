import 'package:get/get.dart';
import 'package:alarmed/domain/entities/alarm.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class AlarmController extends GetxController {
  final _alarmList = [].obs;
  final _volume = 0.0.obs;
  final _morningList = [].obs;
  final _afternoonList = [].obs;

  get morningList => _morningList;
  final _nightList = [].obs;

  DateTime mostRecentWeekday(DateTime date, int weekday) =>
      DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7);

  List filterDates(DateTime start, DateTime end, List dates) {
    var output = [];
    for (var i in dates) {
      print(i.startDateTime.compareTo(start));

      print(i.startDateTime.compareTo(end));
      if (i.startDateTime.compareTo(start) >= 0 &&
          i.startDateTime.compareTo(end) <= 0) {
        output.add(i);
      }
    }
    return output;
  }

  void createLists(List sortedAlarmList) {
    morningList.clear();
    afternoonList.clear();
    nightList.clear();

    DateTime morningStart = DateTime(0);
    DateTime morningEnd = DateTime(0);

    DateTime afternoonStart = DateTime(0);
    DateTime afternoonEnd = DateTime(0);

    DateTime nightStart = DateTime(0);
    DateTime nightEnd = DateTime(0);

    for (var i in sortedAlarmList) {
      DateTime date = i.startDateTime;
      morningStart = DateTime(date.year, date.month, date.day, 0, 0, 1);
      morningEnd = DateTime(date.year, date.month, date.day, 12, 0, 0);

      afternoonStart = DateTime(date.year, date.month, date.day, 12, 0, 1);
      afternoonEnd = DateTime(date.year, date.month, date.day, 18, 00, 00);

      nightStart = DateTime(date.year, date.month, date.day, 18, 0, 1);
      nightEnd = DateTime(date.year, date.month, date.day, 0, 0, 0);

      if (date.isAfter(morningStart) && date.isBefore(morningEnd)) {
        morningList.add(i);
      } else if (date.isAfter(afternoonStart) && date.isBefore(afternoonEnd)) {
        afternoonList.add(i);
      } else {
        nightList.add(i);
      }
    }
  }

  void sortAlarms() {
    var sortedAlarmList = [];

    DateTime monday = mostRecentWeekday(_alarmList[0].startDateTime, 1);
    DateTime sunday =
        DateTime(monday.year, monday.month, monday.day + 6, 23, 59, 59);

    print(
        "El lunes mas reciente es el ${DateFormat('yyyy-MM-dd hh:mm:ss').format(sunday)}");
    print("hoy es ${DateFormat('yyyy-MM-dd').format(DateTime.now())}");
    sortedAlarmList = filterDates(monday, sunday, _alarmList);

    sortedAlarmList = List.from(sortedAlarmList
      ..sort((item1, item2) =>
          item1.startDateTime.compareTo(item2.startDateTime)));

    print("LA DE ARRIBA NO ESTA ORDENADA");
    for (var e in sortedAlarmList) {
      print(e.startDateTime);
      // sortedAlarmList Tiene las alarmas ordenadas por fecha y solo las alarmas de la semana actual.
      // OJO, hay que cambiar el _alarmList[1] del monday por DateTime.now();
      //Para hacer: ordenar en pantalla de conf alarm
    }

    createLists(sortedAlarmList);
    print("\n\n-----------------LISTA DE LA MAÑANA------------");

    for (var e in morningList) {
      print(e.startDateTime);
    }

    print("\n\n-----------------LISTA DE LA TARDE------------");

    for (var e in afternoonList) {
      print(e.startDateTime);
    }

    print("\n\n-----------------LISTA DE LA NOCHE------------");

    for (var e in nightList) {
      print(e.startDateTime);
    }
    initializeDateFormatting();
    var days = DateFormat.EEEE('es-ES').format(DateTime.now());
    print(days);
  }

  void setVolume(value, id) {
    for (var e in _alarmList) {
      if (e.id == id) {
        e.volume = value;
        _alarmList.refresh();

        return;
      }
    }
  }

  double getVolume(id) {
    for (var e in _alarmList) {
      if (e.id == id) {
        return e.volume;
      }
    }
    return 1;
  }

  get alarmList => _alarmList;

  void addAlarm(
    String pillName,
    List days,
    DateTime startDateTime,
    DateTime? endDateTime,
    int repeat,
    int quantity,
    int dose,
    String? tone,
    double? volume,
  ) {
    _alarmList.add(Alarm(
      id: Random().nextInt(30000),
      pillName: pillName,
      days: days,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      repeat: repeat,
      quantity: quantity,
      dose: dose,
      tone: tone ?? 'Default',
      volume: volume ?? 1,
    ));
  }

  get afternoonList => _afternoonList;

  get nightList => _nightList;
}

import 'dart:convert';
import 'package:alarmed/domain/entities/pharmacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:alarmed/data/db.dart';
import 'package:alarmed/domain/entities/alarm.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class UserController extends GetxController {
  final _loggedUserId = "".obs;
  final Rx<Position> _loggedUserCurrentLocation = Position(
    latitude: 0,
    longitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  ).obs;
  final Rx<Position> _loggedUserLastUpdatedLocation = Position(
    latitude: 0,
    longitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  ).obs;

  final _loggedUserNearbyPharmacies = [].obs;

  get loggedUserId => _loggedUserId.value;
  get loggedUserCurrentLocation => _loggedUserCurrentLocation.value;
  get loggedUserNearbyPharmacies => _loggedUserNearbyPharmacies.value;

  set loggedUserNearbyPharmacies(value) =>
      _loggedUserNearbyPharmacies.value = value;

  set loggedUserId(value) {
    print("Setting logged user to $value");
    _loggedUserId.value = value;
  }

  set loggedUserCurrentLocation(value) {
    _loggedUserCurrentLocation.value = value;
  }

  final databaseRef = FirebaseDatabase.instance.ref();

  Future<void> createUser(email, uid) async {
    print("Creating user in realTime for $email and $uid");
    try {
      await databaseRef.child('userList').child(uid).set({'email': email});
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Future<void> addAlarmToLoggedUser(Alarm alarm) async {
    try {
      String json = jsonEncode(alarm.days);

      // var alo = jsonDecode(json) as List<dynamic>; //these next lines are for decoding (for db instances)
      //
      // alo.forEach((element) {
      //   print(element);
      // });
      String startDate =
          DateFormat('yyyy-MM-dd – kk:mm').format(alarm.startDateTime);
      String endDate =
          DateFormat('yyyy-MM-dd – kk:mm').format(alarm.endDateTime);

      // var dbRef = FirebaseDatabase.instance
      //     .ref()
      //     .child("userList")
      //     .child(_loggedUserId.value)
      //     .child('alarm');
      // var snapshot = await dbRef.get();
      // var a = snapshot.value as Map<dynamic, dynamic>;
      // a.forEach((key, values) {
      //   print(values);
      // });

      await databaseRef
          .child('userList')
          .child(_loggedUserId.value)
          .child('alarm')
          .child(alarm.id.toString())
          .set({
        'id': alarm.id,
        'pillName': alarm.pillName,
        'days': json,
        'startDateTime': startDate,
        'endDateTime': endDate,
        'repeat': alarm.repeat,
        'quantity': alarm.quantity,
        'dose': alarm.dose,
        'tone': alarm.tone,
        'volume': alarm.volume
      });
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Future<void> deleteAlarmFromLoggedUser(int id) async {
    try {
      await databaseRef
          .child('userList')
          .child(_loggedUserId.value)
          .child('alarm')
          .child(id.toString())
          .remove();
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Future<void> getLoggedUserAlarms() async {
    var dbRef = FirebaseDatabase.instance
        .ref()
        .child("userList")
        .child(_loggedUserId.value)
        .child('alarm');
    var snapshot = await dbRef.get();

    if (snapshot.value != null) {
      var alarms = snapshot.value as Map<dynamic, dynamic>;
      alarms.forEach((key, values) {
        print(values['pillName']);
        Alarm alarm = Alarm(
            id: values['id'],
            pillName: values['pillName'],
            days: jsonDecode(values['days']) as List<dynamic>,
            startDateTime:
                DateFormat('yyyy-MM-dd – kk:mm').parse(values['startDateTime']),
            endDateTime:
                DateFormat('yyyy-MM-dd – kk:mm').parse(values['endDateTime']),
            repeat: values['repeat'],
            quantity: values['quantity'],
            dose: values['dose'],
            tone: values['tone'],
            volume: values['volume'].toDouble());
        DB.insert(alarm);
      });
    }
  }
}

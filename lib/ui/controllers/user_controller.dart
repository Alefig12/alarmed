import 'dart:convert';

import 'package:alarmed/domain/entities/alarm.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class UserController extends GetxController {
  final _loggedUserId = "".obs;

  get loggedUserId => _loggedUserId;

  set loggedUserId(value) {
    print("Setting logged user to $value");
    _loggedUserId.value = value;
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
      String startDate =
          DateFormat('yyyy-MM-dd – kk:mm').format(alarm.startDateTime);
      String endDate =
          DateFormat('yyyy-MM-dd – kk:mm').format(alarm.endDateTime);

      var dbRef = FirebaseDatabase.instance
          .ref()
          .child("userList")
          .child(_loggedUserId.value)
          .child('alarm');
      var snapshot = await dbRef.get(); // 👈 Use await here
      var a = snapshot.value as Map<dynamic, dynamic>;
      a.forEach((key, values) {
        print(values);
      });

      // await databaseRef
      //     .child('userList')
      //     .child(_loggedUserId.value)
      //     .child('alarm')
      //     .push()
      //     .set({
      //   'id': alarm.id,
      //   'pillName': alarm.pillName,
      //   'days': json,
      //   'startDateTime': startDate,
      //   'endDateTime': endDate,
      //   'repeat': alarm.repeat,
      //   'quantity': alarm.quantity,
      //   'dose': alarm.dose,
      //   'tone': alarm.tone,
      //   'volume': alarm.volume
      // }); // tambien buscar que se pone en el id, porque ahora solo genera 1 sola. Buscar como se recorreria las alarmas si las hago con el id.
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }
}

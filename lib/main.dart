import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:alarmed/ui/controllers/user_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/app.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AlarmController());
  Get.put(AuthenticationController());
  Get.put(UserController());

  runApp(const MyApp());
}

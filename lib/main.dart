import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:flutter/material.dart';
import 'ui/app.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AlarmController());
  runApp(const MyApp());
}

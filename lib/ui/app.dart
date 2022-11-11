// ignore_for_file: prefer_const_constructors

import 'package:alarmed/ui/assets/constant.dart';
import 'package:alarmed/ui/pages/Registration_page.dart';
import 'package:alarmed/ui/pages/calendar_page.dart';
import 'package:alarmed/ui/pages/scheduling_page.dart';
import 'package:alarmed/ui/pages/alarms_page.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:alarmed/ui/pages/navigation_page.dart';
import 'package:alarmed/ui/pages/change_foto_page.dart';
import 'package:flutter/material.dart';
import 'pages/Registration_page.dart';
import 'pages/User_Password_page.dart';
import 'pages/login_page.dart';
import 'package:get/get.dart';
import 'package:alarmed/ui/pages/firebase_central.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarmed',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'LincolnRoad',
          scaffoldBackgroundColor: Constant.secondCont3),
      home: FirebaseCentral(),
    );
  }
}

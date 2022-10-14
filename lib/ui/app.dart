import 'package:alarmed/ui/pages/Registration_page.dart';
import 'package:alarmed/ui/pages/calendar_page.dart';
import 'package:alarmed/ui/pages/medicine_alarm.dart';
import 'package:alarmed/ui/pages/scheduling_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarmed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SchedulingPage(),
    );
  }
}

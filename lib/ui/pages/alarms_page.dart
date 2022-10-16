// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_constructors

import 'package:alarmed/ui/Widgets/alarm_card.dart';
import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "dart:math" as math;
import '../../custom_icons_icons.dart';
import '../widgets/roundedbox_widget.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find();
    return Scaffold(
        key: const Key('AlarmScaffold'),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Constant.secondCont,
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('CONFIGURACIÓN DE ALARMAS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Constant.mainCont)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (var i in alarmController.alarmList)
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: AlarmCard(
                            id: i.getId(),
                            pillName: i.getPillName(),
                            date: i.getDate(),
                          ),
                        )
                    ]),
              )),
        )));
  }
}

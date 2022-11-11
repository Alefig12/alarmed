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
              padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: Obx(
                () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 0),
                        child: Text('Mis medicamentos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LincolnRoad',
                                fontSize: 25,
                                color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (var i in alarmController.alarmList)
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: AlarmCard(
                            id: i.getId(),
                            pillName: i.getPillName(),
                            date: i.getDate(),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: RawMaterialButton(
                            clipBehavior: Clip.none,
                            onPressed: () {},
                            elevation: 0.5,
                            fillColor: Constant.thirdRed,
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 55.0,
                              color: Constant.title,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          )),
                    ]),
              )),
        )));
  }
}

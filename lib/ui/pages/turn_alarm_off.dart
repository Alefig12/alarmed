// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

import "dart:math" as math;

import 'package:get/get.dart';

class TurnAlarmOff extends StatelessWidget {
  TurnAlarmOff(
      {Key? key,
      required this.pillName,
      required this.iconPill,
      required this.idAlarm,
      this.autoPlay = false,
      this.duration})
      : super(key: key);

  final int idAlarm;
  final String pillName;
  final IconData iconPill;
  final ShakeConstant shakeConstant = ShakeDefaultConstant1();
  final bool autoPlay;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find();
    return Scaffold(
        key: Key('TurnOffScaffold'),
        body: Container(
          decoration: BoxDecoration(color: Constant.mainCont),
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShakeWidget(
                  duration: duration,
                  shakeConstant: shakeConstant,
                  autoPlay: true,
                  enableWebMouseHover: true,
                  child: Column(
                    children: [
                      MainRoundedBox(
                        radius: 45,
                        width: 90,
                        height: 90,
                        color: Constant.inCont,
                        child: Center(
                          child: Icon(
                            iconPill,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('¡Hora de tomar la Pastilla!',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Constant.secondCont)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        pillName,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Constant.title),
                      ),
                    ],
                  ),
                ),
                RoundTextButton(
                    width: 150,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      alarmController.deleteAlarm(idAlarm);
                    },
                    child: Text(
                      'Apagar',
                      style: TextStyle(
                          color: Constant.mainCont,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    color: Color.fromARGB(255, 230, 190, 12))
              ],
            ),
          )),
        ));
  }
}

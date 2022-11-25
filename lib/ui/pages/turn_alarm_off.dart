// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:alarmed/ui/pages/firebase_central.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

import "dart:math" as math;

import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  bool dayTime = 6 < DateTime.now().hour &&
      DateTime.now().hour < 18; //si es de dia es true, sino es false

  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find();
    return Scaffold(
        key: Key('TurnOffScaffold'),
        body: Container(
          decoration: BoxDecoration(
              color: dayTime ? Constant.secondCont4 : Constant.mainCont),
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
                      Text('¡Es hora de tomar \ntus pastillas!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: dayTime
                                  ? Constant.mainCont
                                  : Constant.title)),
                      SizedBox(
                        height: 23,
                      ),
                      MainRoundedBox(
                        radius: 75,
                        width: 150,
                        height: 150,
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                        child: Center(
                          child: Icon(
                            iconPill,
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(1.0),
                            size: 90,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          pillName,
                          textAlign: TextAlign.center,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Poppings',
                              color:
                                  dayTime ? Constant.mainCont : Constant.title),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        DateFormat('hh:mm a').format(DateTime.now()),
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Poppings',
                            color: Constant.mainCont),
                      ),
                    ],
                  ),
                ),
                RoundTextButton(
                  width: 200,
                  onPressed: () {
                    Get.back();
                    alarmController.deleteAlarm(idAlarm);
                  },
                  child: Text(
                    '¡Listo!',
                    style: TextStyle(
                        color: Constant.title,
                        fontWeight: FontWeight.w600,
                        fontSize: 32),
                  ),
                  color: Constant.mainCont2,
                  elevation: 8,
                )
              ],
            ),
          )),
        ));
  }
}

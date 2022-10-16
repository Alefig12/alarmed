// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import "dart:math" as math;

import '../../custom_icons_icons.dart';
import '../controllers/alarm_controller.dart';

class TurnAlarmOff extends StatelessWidget {
  const TurnAlarmOff({Key? key, required this.pillName, required this.iconPill})
      : super(key: key);
  final String pillName;
  final Icon iconPill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('TurnOffScaffold'),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  MainRoundedBox(
                    radius: 35,
                    width: 70,
                    height: 70,
                    color: Constant.inCont,
                    child: Center(
                      child: Transform.rotate(
                          angle: -math.pi / 1.65, child: iconPill),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pillName,
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text('Hora de tomar tu pastilla'),
              RoundTextButton(
                  child: Text(
                    'Apagar',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  color: Constant.mainCont)
            ],
          ),
        )));
  }
}

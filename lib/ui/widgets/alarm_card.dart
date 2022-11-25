import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import "dart:math" as math;
import '../../custom_icons_icons.dart';
import '../widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:get/get.dart';

class AlarmCard extends StatelessWidget {
  AlarmCard(
      {Key? key,
      required this.id,
      required this.pillName,
      required this.date,
      this.tono,
      this.volumen})
      : super(key: key);

  final int id;
  final String pillName;
  final DateTime date;
  final String? tono;
  final double? volumen;

  double _currentSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find();
    return Container(
      decoration: BoxDecoration(
          color: Constant.secondCont4, borderRadius: BorderRadius.circular(35)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    flex: 1,
                    child: MainRoundedBox(
                      radius: 60,
                      width: 80,
                      height: 80,
                      shadowColor: Color.fromARGB(149, 112, 127, 143),
                      color: Constant.title,
                      child: Center(
                        child: Transform.rotate(
                          angle: -math.pi / 1.65,
                          child: Icon(
                            FontAwesomeIcons.pills,
                            color: Constant.thirdGreen,
                            size: 45,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 3,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          pillName.toUpperCase(),
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LincolnRoad',
                              color: Constant.mainCont),
                        ),
                        Text("${DateFormat('EEEE').format(date)}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Constant.mainCont,
                              fontFamily: 'poppins',
                            )),
                        Text("Hora ${DateFormat('kk:mm a').format(date)}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'poppins',
                                color: Color.fromARGB(255, 79, 77, 153))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Constant.mainCont),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35)))),
                  ),
                  onPressed: () {
                    alarmController.deleteAlarm(id);
                  },
                  child: Text(
                    'Eliminar',
                    style: TextStyle(fontSize: 40, color: Constant.secondCont4),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

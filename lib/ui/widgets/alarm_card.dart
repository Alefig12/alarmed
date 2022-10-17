import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
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
          color: Constant.secondCont, borderRadius: BorderRadius.circular(15)),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    flex: 1,
                    child: MainRoundedBox(
                      radius: 35,
                      width: 70,
                      height: 70,
                      color: Constant.inCont,
                      child: Center(
                        child: Transform.rotate(
                          angle: -math.pi / 1.65,
                          child: const Icon(
                            CustomIcons.pills,
                            color: Colors.white,
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
                          pillName,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("Dia: ${DateFormat('EEE d MMM').format(date)}",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text("Hora: ${DateFormat('kk:mm').format(date)}",
                            style: const TextStyle(
                              fontSize: 15,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              // ignore: prefer_const_literals_to_create_immutables
              SizedBox(height: 13),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Expanded(
                  child: Center(
                    child: Text("Tono", style: TextStyle(fontSize: 15)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RoundTextInput(
                    color: Constant.mainCont,
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text("Volumen", style: TextStyle(fontSize: 15)),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Obx(
                    () => Slider(
                      value: alarmController.getVolume(id),
                      onChanged: (value) {
                        alarmController.setVolume(value, id);
                      },
                      activeColor: Constant.mainCont,
                      inactiveColor: Constant.inCont,
                    ),
                  ),
                ),
              ]),
              Align(
                alignment: Alignment.centerRight,
                child: RoundTextButton(
                  color: Colors.white,
                  child: Text(
                    "ELIMINAR",
                    style: TextStyle(
                        color: Constant.mainCont, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    alarmController.deleteAlarm(id);
                  },
                ),
              )
            ],
          )),
    );
  }
}

// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:alarmed/ui/pages/menu_page.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/alarm.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List weekDays = [
    'lunes',
    'martes',
    'miércoles',
    'jueves',
    'viernes',
    'sábado',
    'domingo',
  ];
  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find();
    return Scaffold(
        key: Key('CalendarScaffold'),
        backgroundColor: Constant.secondCont4,
        body: SafeArea(
            child: Center(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                child: Icon(
                                  FontAwesomeIcons.cloudSun,
                                  color: Constant.thirdOrange,
                                  size: 50.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 6,
                              child: FittedBox(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ' Buenos días, María!',
                                    style: TextStyle(
                                        fontSize: 200,
                                        color: Constant.mainCont),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon:
                                Icon(FontAwesomeIcons.userAstronaut, size: 50),
                            color: Constant.mainCont,
                            onPressed: () {
                              Get.to(() => const MenuPage());
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: FittedBox(
                        child: Text(
                          'Este es tu \nHorario',
                          style:
                              TextStyle(fontSize: 30, color: Constant.mainCont),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: MainRoundedBox(
                                  width: double.infinity,
                                  color: Constant.mainCont,
                                  radius: 10,
                                  child: FittedBox(
                                      child: Text(
                                    'Hora',
                                    style: TextStyle(color: Constant.title),
                                  )),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                flex: 3,
                                child: MainRoundedBox(
                                  width: double.infinity,
                                  color: Constant.mainCont,
                                  radius: 14,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: FittedBox(
                                                child: Text(
                                          '12:00 am',
                                          style: TextStyle(
                                            color: Constant.title,
                                            fontFamily: 'Poppins',
                                          ),
                                        ))),
                                        Expanded(
                                          child: Icon(
                                            FontAwesomeIcons.cloudSun,
                                            color: Constant.thirdOrange,
                                            size: 30.0,
                                          ),
                                        ),
                                        Expanded(
                                            child: FittedBox(
                                                child: Text('12:00 pm',
                                                    style: TextStyle(
                                                      color: Constant.title,
                                                      fontFamily: 'Poppins',
                                                    ))))
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                flex: 3,
                                child: MainRoundedBox(
                                  width: double.infinity,
                                  color: Constant.mainCont,
                                  radius: 14,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: FittedBox(
                                                child: Text(
                                          '12:00 pm',
                                          style: TextStyle(
                                            color: Constant.title,
                                            fontFamily: 'Poppins',
                                          ),
                                        ))),
                                        Expanded(
                                          child: Icon(
                                            Icons.sunny,
                                            color: Constant.thirdOrange,
                                            size: 30.0,
                                          ),
                                        ),
                                        Expanded(
                                            child: FittedBox(
                                                child: Text('6:00 pm',
                                                    style: TextStyle(
                                                      color: Constant.title,
                                                      fontFamily: 'Poppins',
                                                    ))))
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                flex: 3,
                                child: MainRoundedBox(
                                  width: double.infinity,
                                  color: Constant.mainCont,
                                  radius: 14,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: FittedBox(
                                                child: Text(
                                          '6:00 pm',
                                          style: TextStyle(
                                            color: Constant.title,
                                            fontFamily: 'Poppins',
                                          ),
                                        ))),
                                        Expanded(
                                          child: Icon(
                                            Icons.nightlight_round,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                        Expanded(
                                            child: FittedBox(
                                                child: Text('12:00 am',
                                                    style: TextStyle(
                                                      color: Constant.title,
                                                      fontFamily: 'Poppins',
                                                    ))))
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          flex: 6,
                          child: PageView.builder(
                              controller: PageController(viewportFraction: 1.1),
                              itemCount: weekDays.length,
                              itemBuilder: (context, index) {
                                return FractionallySizedBox(
                                  widthFactor: 1 / 1.1,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: MainRoundedBox(
                                            width: double.infinity,
                                            color: Constant.mainCont,
                                            radius: 10,
                                            child: FittedBox(
                                                child: Text(
                                              weekDays[index],
                                              style: TextStyle(
                                                  color: Constant.title),
                                            )),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: alarmWidget(
                                              listPill: getListPill(
                                                  weekDays[index],
                                                  alarmController
                                                      .morningList))),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: alarmWidget(
                                              listPill: getListPill(
                                                  weekDays[index],
                                                  alarmController
                                                      .afternoonList))),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: alarmWidget(
                                              listPill: getListPill(
                                                  weekDays[index],
                                                  alarmController.nightList))),
                                    ],
                                  ),
                                );
                              }))
                    ],
                  ),
                ))
          ],
        ))));
  }

  List<Alarm> getListPill(String weekDay, listPill) {
    List<Alarm> list = [];

    listPill.forEach((element) {
      String dayName = DateFormat.EEEE('es-ES').format(element.getDate());
      if (dayName.toLowerCase() == weekDay.toLowerCase()) {
        list.add(element);
      }
    });
    return list;
  }
}

class alarmWidget extends StatelessWidget {
  const alarmWidget({
    Key? key,
    required this.listPill,
  }) : super(key: key);

  final List<Alarm> listPill;

  @override
  Widget build(BuildContext context) {
    return MainRoundedBox(
      color: Constant.secondCont3,
      width: double.infinity,
      radius: 14,
      child: ListView.builder(
        itemCount: listPill.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.pills,
                    color: Constant.thirdPink,
                    size: 30.0,
                  ),
                  Column(children: [
                    Text(
                      listPill[index].pillName,
                      style: TextStyle(
                          fontFamily: 'Poppins', color: Constant.title),
                    ),
                    Text(listPill[index].dose.toString(),
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Constant.title)),
                  ]),
                  Text(
                      DateFormat('hh:mm a')
                          .format(listPill[index].startDateTime),
                      style: TextStyle(
                          fontFamily: 'Poppins', color: Constant.title))
                ],
              ),
              Divider(
                color: Constant.secondCont4,
                thickness: 2,
              )
            ],
          );
        },
      ),
    );
  }
}

class itemCalendar extends StatelessWidget {
  const itemCalendar({
    Key? key,
    required this.listPill,
  }) : super(key: key);
  final List<Widget> listPill;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        width: 80,
        child: ListView(children: [
          Column(
            children: listPill,
          ),
        ]),
        decoration: BoxDecoration(
          color: Constant.mainCont,
          borderRadius: BorderRadius.circular(12),
        ));
  }
}

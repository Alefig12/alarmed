// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/controllers/alarm_controller.dart';
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
        body: SafeArea(
            child: Center(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
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
                                  color: Colors.black,
                                  size: 50.0,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: FittedBox(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ' Buenos días!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 200),
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
                          child: Icon(
                            FontAwesomeIcons.userAstronaut,
                            color: Colors.black,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          child: Text(
                            'este es tu',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: Text(
                            'Horario',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: DropDownMenu(),
                      decoration: BoxDecoration(
                          color: Constant.mainCont,
                          borderRadius: BorderRadius.circular(30)),
                    )),
              ),
            ),
            Expanded(
              flex: 20,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column(children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Hora',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.mainCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Lunes',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.secondCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Martes',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.secondCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Miércoles',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.secondCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Jueves',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.secondCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Text('Viernes',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.secondCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('Sábado',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.secondCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 80,
                                  height: 45,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Text('Domingo',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constant.secondCont,
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ],
                          )),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(children: [
                          SizedBox(width: 17),
                          Container(
                              padding: EdgeInsets.all(10),
                              width: 80,
                              child: Column(
                                children: [
                                  Expanded(
                                      child: FittedBox(child: Text('1:00 am'))),
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.cloudSun,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                  Expanded(
                                      child: FittedBox(child: Text('12:00 pm')))
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Constant.mainCont,
                                borderRadius: BorderRadius.circular(12),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: List.generate(
                              weekDays.length,
                              (index) => Row(
                                children: [
                                  itemCalendar(
                                    listPill: () {
                                      List<Widget> texts = [];

                                      String day = '';
                                      for (var i
                                          in alarmController.morningList) {
                                        day = DateFormat.EEEE('es-ES')
                                            .format(i.getDate());
                                        print(day.toLowerCase());
                                        print('---');
                                        print(weekDays[index].toLowerCase());
                                        print('-_-_-_-_');

                                        if (day.toLowerCase() ==
                                            weekDays[index].toLowerCase()) {
                                          print('sienre');
                                          texts.add(Text(i.getPillName()));
                                        }
                                      }

                                      print(texts);
                                      return texts;
                                    }(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(children: [
                          SizedBox(width: 17),
                          Container(
                              padding: EdgeInsets.all(10),
                              width: 80,
                              child: Column(
                                children: [
                                  Text('1:00 pm'),
                                  Icon(
                                    Icons.light_mode,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  Text('6:00 pm')
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Constant.mainCont,
                                borderRadius: BorderRadius.circular(12),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: List.generate(
                              weekDays.length,
                              (index) => Row(
                                children: [
                                  itemCalendar(
                                    listPill: () {
                                      List<Widget> texts = [];

                                      String day = '';
                                      for (var i
                                          in alarmController.afternoonList) {
                                        day = DateFormat.EEEE('es-ES')
                                            .format(i.getDate());
                                        print(day.toLowerCase());
                                        print('---');
                                        print(weekDays[index].toLowerCase());
                                        print('-_-_-_-_');

                                        if (day.toLowerCase() ==
                                            weekDays[index].toLowerCase()) {
                                          print('sienre');
                                          texts.add(Text(i.getPillName()));
                                        }
                                      }

                                      print(texts);
                                      return texts;
                                    }(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(children: [
                          SizedBox(width: 17),
                          Container(
                              padding: EdgeInsets.all(10),
                              width: 80,
                              child: Column(
                                children: [
                                  Expanded(
                                      child: FittedBox(child: Text('7:00 am'))),
                                  Expanded(
                                    child: Icon(
                                      Icons.nightlight_round,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                  Expanded(
                                      child: FittedBox(child: Text('12:00 am')))
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Constant.mainCont,
                                borderRadius: BorderRadius.circular(12),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: List.generate(
                              weekDays.length,
                              (index) => Row(
                                children: [
                                  itemCalendar(
                                    listPill: () {
                                      List<Widget> texts = [];

                                      String day = '';
                                      for (var i in alarmController.nightList) {
                                        day = DateFormat.EEEE('es-ES')
                                            .format(i.getDate());
                                        print(day.toLowerCase());
                                        print('---');
                                        print(weekDays[index].toLowerCase());
                                        print('-_-_-_-_');

                                        if (day.toLowerCase() ==
                                            weekDays[index].toLowerCase()) {
                                          print('sienre');
                                          texts.add(Text(i.getPillName()));
                                        }
                                      }

                                      print(texts);
                                      return texts;
                                    }(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ])
                ],
              ),
            ),
          ],
        ))));
  }
}

const List<String> list = <String>['3días', '5días', 'Todos'];

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.expand_more,
        color: Colors.white,
      ),
      elevation: 16,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        );
      }).toList(),
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
          color: Constant.secondCont,
          borderRadius: BorderRadius.circular(12),
        ));
  }
}

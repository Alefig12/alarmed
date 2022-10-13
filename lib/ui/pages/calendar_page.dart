// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('CalendarScaffold'),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            Align(alignment: Alignment.bottomLeft, child: Text('Buenos días')),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text('este es tu Horario')),
            Align(alignment: Alignment.bottomRight, child: DropDownMenu()),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(children: [
                    Container(
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
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(children: [
                        Container(
                            width: 80,
                            child: Column(
                              children: [
                                Text('1:00 am'),
                                Icon(
                                  Icons.wb_twilight,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text('12:00 pm')
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Constant.mainCont,
                              borderRadius: BorderRadius.circular(12),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(children: [
                        Container(
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
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(children: [
                        Container(
                            width: 80,
                            child: Column(
                              children: [
                                Text('7:00 am'),
                                Icon(
                                  Icons.nightlight_round,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text('12:00 am')
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Constant.mainCont,
                              borderRadius: BorderRadius.circular(12),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                        SizedBox(
                          width: 20,
                        ),
                        itemCalendar(
                            listPill: [Text('pastilla'), Text('break')]),
                      ]),
                    )
                  ])
                ],
              ),
            ),
          ],
        ))));
  }
}

const List<String> list = <String>['3', '5', 'All'];

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
      icon: const Icon(Icons.arrow_downward),
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
          child: Text(value),
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
        width: 80,
        child: Column(
          children: listPill,
        ),
        decoration: BoxDecoration(
          color: Constant.secondCont,
          borderRadius: BorderRadius.circular(12),
        ));
  }
}

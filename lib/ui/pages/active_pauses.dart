// ignore_for_file: prefer_const_constructors
// ignore: prefer_const_constructors

import 'package:alarmed/ui/Widgets/alarm_card.dart';
import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:alarmed/ui/pages/scheduling_page.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "dart:math" as math;
import '../../custom_icons_icons.dart';

class ActivePausesPage extends StatefulWidget {
  @override
  _ActivePausesPageState createState() => _ActivePausesPageState();
}

class _ActivePausesPageState extends State<ActivePausesPage> {
  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find();
    return Scaffold(
        key: const Key('AlarmScaffold'),
        body: SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Pausas Activas',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LincolnRoad',
                        fontSize: 40,
                        color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MainRoundedBox(
                color: Constant.secondCont4,
                radius: 35,
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
                              width: 70,
                              height: 70,
                              shadowColor: Color.fromARGB(149, 112, 127, 143),
                              color: Constant.title,
                              child: Center(
                                child: Icon(
                                  Icons.self_improvement,
                                  color: Constant.mainCont2,
                                  size: 50,
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
                                  'Meditación',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'LincolnRoad',
                                      color: Constant.mainCont),
                                ),
                                Text("Lunes",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Constant.mainCont,
                                      fontFamily: 'poppins',
                                    )),
                                Text("5:30 PM",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'poppins',
                                        color:
                                            Color.fromARGB(255, 79, 77, 153))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constant.mainCont),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35)))),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Eliminar',
                            style: TextStyle(
                                fontSize: 40, color: Constant.secondCont4),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MainRoundedBox(
                color: Constant.secondCont4,
                radius: 35,
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
                              width: 70,
                              height: 70,
                              shadowColor: Color.fromARGB(149, 112, 127, 143),
                              color: Constant.title,
                              child: Center(
                                child: Icon(
                                  Icons.accessibility_new,
                                  color: Constant.mainCont2,
                                  size: 50,
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
                                  'Estirar',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'LincolnRoad',
                                      color: Constant.mainCont),
                                ),
                                Text("Miércoles",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Constant.mainCont,
                                      fontFamily: 'poppins',
                                    )),
                                Text("6:40 AM",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'poppins',
                                        color:
                                            Color.fromARGB(255, 79, 77, 153))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constant.mainCont),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35)))),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Eliminar',
                            style: TextStyle(
                                fontSize: 40, color: Constant.secondCont4),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MainRoundedBox(
                color: Constant.secondCont4,
                radius: 35,
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
                              width: 70,
                              height: 70,
                              shadowColor: Color.fromARGB(149, 112, 127, 143),
                              color: Constant.title,
                              child: Center(
                                child: Icon(
                                  Icons.sports_martial_arts,
                                  color: Constant.mainCont2,
                                  size: 50,
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
                                  'Patadas',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'LincolnRoad',
                                      color: Constant.mainCont),
                                ),
                                Text("Viernes",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Constant.mainCont,
                                      fontFamily: 'poppins',
                                    )),
                                Text("4:50 PM",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'poppins',
                                        color:
                                            Color.fromARGB(255, 79, 77, 153))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constant.mainCont),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35)))),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Eliminar',
                            style: TextStyle(
                                fontSize: 40, color: Constant.secondCont4),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MainRoundedBox(
                color: Constant.secondCont4,
                radius: 35,
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
                              width: 70,
                              height: 70,
                              shadowColor: Color.fromARGB(149, 112, 127, 143),
                              color: Constant.title,
                              child: Center(
                                child: Icon(
                                  Icons.directions_walk,
                                  color: Constant.mainCont2,
                                  size: 50,
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
                                  'Caminata',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'LincolnRoad',
                                      color: Constant.mainCont),
                                ),
                                Text("Sábado",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Constant.mainCont,
                                      fontFamily: 'poppins',
                                    )),
                                Text("8:00 AM",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'poppins',
                                        color:
                                            Color.fromARGB(255, 79, 77, 153))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Constant.mainCont),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35)))),
                          ),
                          onPressed: () {},
                          child: Text(
                            '',
                            style: TextStyle(
                                fontSize: 40, color: Constant.secondCont4),
                          )),
                    )
                  ],
                ),
              ),
            )
          ]),
        )));
  }
}

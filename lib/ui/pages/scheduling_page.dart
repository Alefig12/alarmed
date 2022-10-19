import 'dart:convert';

import 'package:alarmed/custom_icons_icons.dart';
import 'package:alarmed/services/local_notification_service.dart';
import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:alarmed/ui/pages/save_dialog.dart';
import 'package:alarmed/ui/pages/turn_alarm_off.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  DateTime _sDate = DateTime.now();
  String sDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateTime _eDate = DateTime.now();
  String eDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  List<bool> daysIndex = [false, false, false, false, false, false, false];

  void _selectDate(bool startEnd) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: startEnd ? _sDate : _eDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2032, 7),
      helpText: 'Selecciona una fecha',
    );
    if (newDate != null) {
      setState(() {
        if (startEnd) {
          _sDate = newDate;
          sDate = DateFormat('yyyy-MM-dd').format(newDate);
        } else {
          _eDate = newDate;
          eDate = DateFormat('yyyy-MM-dd').format(newDate);
        }
      });
    }
  }

  bool isChecked = false;
  int selectedNum = 0;

  final pillNameTextController = TextEditingController();
  final quantityTextController = TextEditingController();
  final doseTextController = TextEditingController();
  Color enabled = Constant.button;
  Color disabled = Constant.inCont;

  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    listenToNotification();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find<AlarmController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: const Key('SchedulingScaffold'),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: MainRoundedBox(
                      width: double.infinity,
                      color: Constant.button,
                      child: Center(
                        child: Text(
                          "Programa tus medicinas!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constant.title,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 7,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.mainCont,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: MainRoundedBox(
                                      radius: 40,
                                      width: 50,
                                      height: 50,
                                      color: Constant.inCont,
                                      child: Center(
                                        child: Transform.rotate(
                                          angle: -math.pi / 1.65,
                                          child: const Icon(
                                            CustomIcons.pill,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  flex: 5,
                                  child: RoundTextInput(
                                    textController: pillNameTextController,
                                    height: 40,
                                    width: 230,
                                    color: Constant.inCont,
                                    label: 'Nombre del medicamento',
                                    hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Constant.button,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: RoundTextButton(
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                        onPressed: () {},
                                        child: Text('')),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Center(
                                    child: RoundTextButton(
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                        onPressed: () async {
                                          await service
                                              .showScheduledNotificationPayload(
                                                  id: 0,
                                                  title: "TEST NOTIF",
                                                  body: "Test Notif",
                                                  date: DateTime.now().add(
                                                      Duration(seconds: 3)),
                                                  payload: 'payload');
                                        },
                                        child: Text('')),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Center(
                                    child: RoundTextButton(
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                        child: Text('')),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Center(
                                    child: RoundTextButton(
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                        child: Text('')),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Center(
                                    child: RoundTextButton(
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                        child: Text('')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RoundTextButton(
                                    width: 150,
                                    height: double.infinity,
                                    color: Constant.inCont,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.add_circle_outline,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'Más opciones',
                                              style: TextStyle(
                                                letterSpacing: 10,
                                                fontSize: 150,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 3,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.mainCont,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RoundTextButton(
                            height: double.infinity,
                            color: Constant.mainCont,
                            onPressed: _selectTime,
                            child: FittedBox(
                              child: Text(
                                _time.format(context),
                                style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 3,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.mainCont,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RoundTextButton(
                              radius: 30,
                              color: daysIndex[0] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[0] = !daysIndex[0];
                                });
                              },
                              child: const Text(
                                'D',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              radius: 30,
                              color: daysIndex[1] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[1] = !daysIndex[1];
                                });
                              },
                              child: const Text(
                                'L',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              radius: 30,
                              color: daysIndex[2] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[2] = !daysIndex[2];
                                });
                              },
                              child: const Text(
                                'M',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              radius: 30,
                              color: daysIndex[3] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[3] = !daysIndex[3];
                                });
                              },
                              child: const Text(
                                'M',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              radius: 30,
                              color: daysIndex[4] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[4] = !daysIndex[4];
                                });
                              },
                              child: const Text(
                                'J',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              radius: 30,
                              color: daysIndex[5] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[5] = !daysIndex[5];
                                });
                              },
                              child: const Text(
                                'V',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              radius: 30,
                              color: daysIndex[6] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[6] = !daysIndex[6];
                                });
                              },
                              child: const Text(
                                'S',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MainRoundedBox(
                          height: double.infinity,
                          color: Constant.mainCont,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Inicia el",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      RoundTextButton(
                                        width: double.infinity,
                                        radius: 12,
                                        color: Constant.inCont,
                                        onPressed: () {
                                          _selectDate(true);
                                        },
                                        child: Text(
                                          sDate,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Finaliza el",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      RoundTextButton(
                                        width: double.infinity,
                                        radius: 12,
                                        color: Constant.inCont,
                                        onPressed: isChecked
                                            ? null
                                            : () {
                                                _selectDate(false);
                                              },
                                        child: Text(
                                          eDate,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: isChecked,
                                        shape: CircleBorder(),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                      Text("Nunca")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: MainRoundedBox(
                                width: double.infinity,
                                color: Constant.mainCont,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Se repite",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: RoundTextButton(
                                                  radius: 15,
                                                  width: 100,
                                                  color: Constant.inCont,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: NumberPicker(
                                                      selectedTextStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                      itemCount: 1,
                                                      itemHeight: 30,
                                                      minValue: 0,
                                                      maxValue: 23,
                                                      value: selectedNum,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          selectedNum = val;
                                                        });
                                                      },
                                                    ),
                                                  )),
                                            ),
                                            SizedBox(width: 10),
                                            const Expanded(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Horas',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              flex: 2,
                              child: MainRoundedBox(
                                width: double.infinity,
                                color: Constant.mainCont,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Dosis",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            const Expanded(
                                                flex: 2,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "cantidad",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                )),
                                            Expanded(
                                              child: RoundTextInput(
                                                textController:
                                                    quantityTextController,
                                                color: Constant.inCont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: RoundTextInput(
                                                textController:
                                                    doseTextController,
                                                color: Constant.inCont,
                                              ),
                                            ),
                                            const Expanded(
                                                child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: FittedBox(
                                                child: Text(
                                                  "Mg",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                                flex: 1,
                                child: RoundTextButton(
                                  width: double.infinity,
                                  color: Constant.button,
                                  onPressed: () {
                                    showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0)),
                                              child: Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: SaveDialog(
                                                    onContinueClick: () =>
                                                        generateAlarm(
                                                            daysIndex,
                                                            pillNameTextController,
                                                            _time,
                                                            sDate,
                                                            eDate,
                                                            selectedNum,
                                                            quantityTextController,
                                                            doseTextController),
                                                  )),
                                            ));

                                    print(alarmController.alarmList);
                                  },
                                  child: const Text(
                                    "Guardar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 84, 84, 84),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void generateAlarm(
      List<bool> daysIndex,
      TextEditingController pillNameTextController,
      TimeOfDay time,
      String sDate,
      String eDate,
      int selectedNum,
      TextEditingController quantityTextController,
      TextEditingController doseTextController) async {
    AlarmController alarmController = Get.find();
    var i = 0;
    var weekDays = [];
    for (var e in daysIndex) {
      if (e) {
        weekDays.add(i);
      }
      i++;
    }
    var pillName = pillNameTextController.text;
    var days = weekDays;
    var timeDT = DateFormat.jm().parse(_time.format(context));

    String timeS = DateFormat("HH:mm").format(timeDT);
    DateTime startDateTime =
        new DateFormat("yyyy-MM-dd hh:mm").parse('$sDate $timeS');

    DateTime endDateTime = new DateFormat("yyyy-MM-dd").parse('$eDate ');

    int repeat = selectedNum;
    int quantity = int.parse(quantityTextController.text);
    int id = UniqueKey().hashCode;
    print(id);
    int dose = int.parse(doseTextController.text);
    print('aloo');
    alarmController.addAlarm(id, pillName, weekDays, startDateTime, endDateTime,
        repeat, quantity, dose, null, null);

    await service.deleteAllScheduledAlarms();

    for (var e in alarmController.alarmList) {
      var map = {"id": e.id, "pillName": e.pillName};
      String mapString = jsonEncode(map);

      await service.showScheduledNotificationPayload(
          id: e.id,
          title: "ALARMED",
          body: "Es hora de tu pastilla!",
          date: e.startDateTime,
          payload: mapString);
    }
    alarmController.sortAlarms();
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print(payload);
      var mapObject = jsonDecode(payload);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TurnAlarmOff(
                    pillName: mapObject["pillName"],
                    iconPill: CustomIcons.pill,
                    idAlarm: mapObject["id"],
                  )));
    }
  }
}

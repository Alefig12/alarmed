import 'dart:convert';

import 'package:alarmed/custom_icons_icons.dart';
import 'package:alarmed/services/local_notification_service.dart';
import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:alarmed/ui/pages/save_dialog.dart';
import 'package:alarmed/ui/pages/turn_alarm_off.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
  TimeOfDay _time = TimeOfDay(
      hour: DateTime.now().hour.toInt(),
      minute: DateTime.now().minute.toInt() + 1);
  double _value = 20;

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
  Color enabled = Constant.mainCont2;
  Color disabled = Constant.secondCont4;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Constant.mainCont2;

  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    listenToNotification();
    super.initState();
    AlarmController alarmController = Get.find();
    if (alarmController.justLoggedin) {
      alarmController.justLoggedin = false;
      setAlarms();
    }
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    AlarmController alarmController = Get.find<AlarmController>();
    AuthenticationController authenticationController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: const Key('SchedulingScaffold'),
      backgroundColor: Constant.secondCont3,
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
                      color: Constant.secondCont3,
                      child: Center(
                        child: Text(
                          "Programa tus medicinas !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constant.title,
                            fontSize: 25,
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
                    color: Constant.secondCont4,
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
                                    child: RoundTextButton(
                                      radius: 50,
                                      width: 90,
                                      height: 90,
                                      color: Colors.white,
                                      child: Center(
                                        child: Transform.rotate(
                                          angle: -math.pi / 1.65,
                                          child: Icon(
                                            CustomIcons.pill,
                                            color: pickerColor,
                                            size: 60,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        _dialogBuilder(context);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: RoundTextInput(
                                        textController: pillNameTextController,
                                        height: 40,
                                        width: 230,
                                        color: Constant.secondCont3,
                                        label: 'Nombre del medicamento',
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                          color: Constant.mainCont,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    'Cantidad',
                                                    style: TextStyle(
                                                        color:
                                                            Constant.mainCont,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: RoundTextInput(
                                                    textController:
                                                        quantityTextController,
                                                    color: Constant.secondCont3,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    'Dosis',
                                                    style: TextStyle(
                                                        color:
                                                            Constant.mainCont,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: RoundTextInput(
                                                    textController:
                                                        doseTextController,
                                                    color: Constant.secondCont3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
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
                  flex: 4,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.secondCont4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RoundTextButton(
                            height: double.infinity,
                            color: Constant.secondCont4,
                            onPressed: _selectTime,
                            child: FittedBox(
                              child: Text(
                                _time.format(context),
                                style: TextStyle(
                                    fontSize: 50, color: Constant.mainCont),
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
                  flex: 4,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.secondCont4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Se repite cada",
                            style: TextStyle(
                              color: Constant.mainCont,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(width: 15),
                          RoundTextButton(
                              radius: 15,
                              width: 50,
                              color: Constant.secondCont3,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: NumberPicker(
                                  selectedTextStyle: TextStyle(
                                      color: Constant.mainCont, fontSize: 20),
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
                          SizedBox(width: 15),
                          Text(
                            "horas",
                            style: TextStyle(
                              color: Constant.mainCont,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 4,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.mainCont,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RoundTextButton(
                              elevation: 7,
                              radius: 30,
                              color: daysIndex[0] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[0] = !daysIndex[0];
                                });
                              },
                              child: FittedBox(
                                child: Text(
                                  'D',
                                  style: TextStyle(
                                    color: Constant.mainCont,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              elevation: 7,
                              radius: 30,
                              color: daysIndex[1] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[1] = !daysIndex[1];
                                });
                              },
                              child: FittedBox(
                                child: Text(
                                  'L',
                                  style: TextStyle(color: Constant.mainCont),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              elevation: 7,
                              radius: 30,
                              color: daysIndex[2] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[2] = !daysIndex[2];
                                });
                              },
                              child: FittedBox(
                                child: Text(
                                  'M',
                                  style: TextStyle(color: Constant.mainCont),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              elevation: 7,
                              radius: 30,
                              color: daysIndex[3] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[3] = !daysIndex[3];
                                });
                              },
                              child: FittedBox(
                                child: Text(
                                  'M',
                                  style: TextStyle(color: Constant.mainCont),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              elevation: 7,
                              radius: 30,
                              color: daysIndex[4] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[4] = !daysIndex[4];
                                });
                              },
                              child: FittedBox(
                                child: Text(
                                  'J',
                                  style: TextStyle(color: Constant.mainCont),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              elevation: 7,
                              radius: 30,
                              color: daysIndex[5] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[5] = !daysIndex[5];
                                });
                              },
                              child: Text(
                                'V',
                                style: TextStyle(color: Constant.mainCont),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: RoundTextButton(
                              elevation: 7,
                              radius: 30,
                              color: daysIndex[6] ? enabled : disabled,
                              onPressed: () {
                                setState(() {
                                  daysIndex[6] = !daysIndex[6];
                                });
                              },
                              child: FittedBox(
                                child: Text(
                                  'S',
                                  style: TextStyle(color: Constant.mainCont),
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
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MainRoundedBox(
                          height: double.infinity,
                          color: Constant.secondCont4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Inicia el",
                                            style: TextStyle(
                                                color: Constant.mainCont,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      RoundTextButton(
                                        width: double.infinity,
                                        radius: 12,
                                        color: Constant.secondCont3,
                                        onPressed: () {
                                          _selectDate(true);
                                        },
                                        child: FittedBox(
                                          child: Text(
                                            sDate,
                                            style: TextStyle(
                                                color: Constant.title),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Finaliza el",
                                            style: TextStyle(
                                                color: Constant.mainCont,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      RoundTextButton(
                                        width: double.infinity,
                                        radius: 12,
                                        color: Constant.secondCont3,
                                        onPressed: isChecked
                                            ? null
                                            : () {
                                                _selectDate(false);
                                              },
                                        child: FittedBox(
                                          child: Text(
                                            eDate,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 6,
                  child: MainRoundedBox(
                    color: Constant.secondCont3,
                    height: double.infinity,
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text("Tono",
                                    style: TextStyle(
                                        fontSize: 15, color: Constant.title)),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: RoundTextInput(
                                color: Constant.title,
                              ),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text("Volumen",
                                    style: TextStyle(
                                        fontSize: 15, color: Constant.title)),
                              ),
                            ),
                            Expanded(
                                flex: 5,
                                child: Slider(
                                  min: 0.0,
                                  max: 100.0,
                                  thumbColor: Constant.mainCont,
                                  activeColor: Constant.mainCont,
                                  inactiveColor: Constant.title,
                                  value: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                )),
                          ]),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 3,
                    child: RoundTextButton(
                      width: double.infinity,
                      color: Constant.mainCont2,
                      elevation: 10,
                      onPressed: () {
                        bool check1 = false;
                        bool check2 = false;

                        if (doseTextController.text.isEmpty) {
                          const snackBar = SnackBar(
                            content: Text('Ingrese una dosis'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (int.tryParse(doseTextController.text) ==
                            null) {
                          const snackBar = SnackBar(
                            content: Text('Ingrese un numero como dosis'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          check1 = true;
                        }

                        if (quantityTextController.text.isEmpty) {
                          const snackBar = SnackBar(
                            content: Text('Ingrese una cantidad'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (int.tryParse(quantityTextController.text) ==
                            null) {
                          const snackBar = SnackBar(
                            content: Text('Ingrese un numero como cantidad'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          check2 = true;
                        }

                        if (check1 && check2) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    child: Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: SaveDialog(onContinueClick: () {
                                          generateAlarm(
                                              daysIndex,
                                              pillNameTextController,
                                              _time,
                                              sDate,
                                              eDate,
                                              selectedNum,
                                              quantityTextController,
                                              doseTextController);
                                          Get.back();
                                        })),
                                  ));
                          print(alarmController.alarmList);
                        }
                      },
                      child: const Text(
                        "Guardar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
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

    print("time de _time: $_time");

    var timeDT = DateFormat.jm().parse(_time.format(context));
    print("time de timeDT: $timeDT");

    String timeS = DateFormat("HH:mm").format(timeDT);
    print("time de timeS: $timeS");
    DateTime startDateTime =
        new DateFormat("yyyy-MM-dd HH:mm").parse('$sDate $timeS');
    print("time de startd: $startDateTime");
    DateTime endDateTime = new DateFormat("yyyy-MM-dd").parse('$eDate ');

    int repeat = selectedNum;
    int quantity = int.parse(quantityTextController.text);
    int id = UniqueKey().hashCode;
    print(id);
    int dose = int.parse(doseTextController.text);
    print('aloo');
    alarmController.addAlarm(id, pillName, weekDays, startDateTime, endDateTime,
        repeat, quantity, dose, null, null);

    setAlarms();
  }

  void setAlarms() async {
    AlarmController alarmController = Get.find();
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
      print("alarms set");
    }

    alarmController.sortAlarms();
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print(payload);
      var mapObject = jsonDecode(payload);

      Get.to(() => TurnAlarmOff(
            pillName: mapObject["pillName"],
            iconPill: CustomIcons.pill,
            idAlarm: mapObject["id"],
          ));
    }
  }
}

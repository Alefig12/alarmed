import 'package:alarmed/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

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

  DateTime _date = DateTime.now();
  String sDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2032, 7),
      helpText: 'Selecciona una fecha',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
        sDate = DateFormat('yyyy-MM-dd').format(newDate);
      });
    }
  }

  bool isChecked = false;
  int selectedNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: const Key('SchedulingScaffold'),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
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
                                MainRoundedBox(
                                  radius: 30,
                                  width: 60,
                                  height: 60,
                                  color: Constant.inCont,
                                  child: const Center(
                                    child: Icon(
                                      CustomIcons.pill,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                RoundTextInput(
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
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                RoundTextButton(
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                    child: Text('')),
                                SizedBox(width: 10),
                                RoundTextButton(
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                    child: Text('')),
                                SizedBox(width: 10),
                                RoundTextButton(
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                    child: Text('')),
                                SizedBox(width: 10),
                                RoundTextButton(
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                    child: Text('')),
                                SizedBox(width: 10),
                                RoundTextButton(
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                    child: Text('')),
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
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            height: double.infinity,
                                            child: Icon(
                                              Icons.add_circle_outline,
                                              size: 17,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Más opciones',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
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
                            child: Text(
                              _time.format(context),
                              style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
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
                  flex: 2,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.mainCont,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RoundTextButton(
                              color: Constant.button,
                              radius: 30,
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
                              color: Constant.button,
                              radius: 30,
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
                              color: Constant.button,
                              radius: 30,
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
                              color: Constant.button,
                              radius: 30,
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
                              color: Constant.button,
                              radius: 30,
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
                              color: Constant.button,
                              radius: 30,
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
                              color: Constant.button,
                              radius: 30,
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
                  flex: 11,
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
                                        onPressed: _selectDate,
                                        child: Text(
                                          sDate,
                                          style: TextStyle(
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
                                        onPressed:
                                            isChecked ? null : _selectDate,
                                        child: Text(
                                          sDate,
                                          style: TextStyle(
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
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Se repite",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                      Row(
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
                                                            color: Colors.white,
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
                                          Expanded(
                                            child: const Align(
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
                                                    color: Constant.inCont)),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: RoundTextInput(
                                                    color: Constant.inCont)),
                                            const Expanded(
                                                child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Mg",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
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
}

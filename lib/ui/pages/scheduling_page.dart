import 'package:alarmed/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  TimeOfDay? time = const TimeOfDay(hour: 12, minute: 00);

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
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                      child: Text(''),
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  RoundTextButton(
                                      width: 40,
                                      height: 40,
                                      child: Text(''),
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  RoundTextButton(
                                      width: 40,
                                      height: 40,
                                      child: Text(''),
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  RoundTextButton(
                                      width: 40,
                                      height: 40,
                                      child: Text(''),
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  RoundTextButton(
                                      width: 40,
                                      height: 40,
                                      child: Text(''),
                                      color: Colors.white),
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
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 5,
                  child: MainRoundedBox(
                    width: double.infinity,
                    color: Constant.mainCont,
                    child: Container(
                      child: TimePickerSpinner(
                        is24HourMode: false,
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
                    child: Column(),
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
                          child: Column(),
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
                                child: Column(),
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              flex: 2,
                              child: MainRoundedBox(
                                width: double.infinity,
                                color: Constant.mainCont,
                                child: Column(),
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

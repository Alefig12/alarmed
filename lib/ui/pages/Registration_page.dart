// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: Key('RegistrationScaffold'),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                MainRoundedBox(
                    padding: 8,
                    width: double.infinity,
                    height: 250,
                    color: Constant.mainCont,
                    child: Column(
                      children: [
                        Text('Información Personal',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 45, color: Constant.title)),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                                width: 350.0,
                                height: 80.0,
                                child: Column(children: [
                                  Flexible(
                                      child: Row(children: [
                                    Text('Nombre:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: RoundTextInput(
                                        color: Colors.white,
                                        radius: 5,
                                      ),
                                    )
                                  ])),
                                  Expanded(
                                      child: Row(children: [
                                    Text('Edad:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: RoundTextInput(
                                        color: Colors.white,
                                        radius: 5,
                                      ),
                                    )
                                  ])),
                                  Expanded(
                                      child: Row(children: [
                                    Text('Enfermedades:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: RoundTextInput(
                                        color: Colors.white,
                                        radius: 5,
                                      ),
                                    )
                                  ])),
                                ])),
                            decoration: BoxDecoration(
                              color: Constant.inCont,
                              borderRadius: BorderRadius.circular(16),
                            ))
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                MainRoundedBox(
                    padding: 8,
                    width: double.infinity,
                    height: 220,
                    color: Constant.mainCont,
                    child: Column(
                      children: [
                        Text('Contacto de emergencia',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 40, color: Constant.title)),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                                width: 350.0,
                                height: 60.0,
                                child: Column(children: [
                                  Expanded(
                                      child: Row(children: [
                                    Text('Nombre:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: RoundTextInput(
                                        color: Colors.white,
                                        radius: 5,
                                      ),
                                    )
                                  ])),
                                  Expanded(
                                      child: Row(children: [
                                    Text('Celular:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: RoundTextInput(
                                        color: Colors.white,
                                        radius: 5,
                                      ),
                                    )
                                  ])),
                                ])),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 117, 123, 128),
                              borderRadius: BorderRadius.circular(16),
                            )),
                      ],
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RoundTextButton(
                      child: Row(children: [
                        Text(
                          'Siguiente',
                          style: TextStyle(color: Constant.title),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30.0,
                        )
                      ]),
                      color: Constant.mainCont,
                      width: 110,
                      height: 50,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}

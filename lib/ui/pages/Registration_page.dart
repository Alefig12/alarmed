// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  MainRoundedBox(
                    child: Column(
                      children: [
                        Text('Cuenta',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: MainRoundedBox(
                            padding: 10,
                            radius: 10,
                            color: Constant.inCont,
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text('Usuario:',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: RoundTextInput(
                                            color: Constant.mainCont)),
                                  ]),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Contraseña:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: RoundTextInput(
                                            color: Constant.mainCont))
                                  ])
                            ]),
                          ),
                        ),
                      ],
                    ),
                    color: Constant.mainCont,
                  ),
                  SizedBox(height: 10),
                  MainRoundedBox(
                      padding: 8,
                      width: double.infinity,
                      height: 250,
                      color: Constant.mainCont,
                      child: Column(
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: Text('Información \nPersonal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 45, color: Constant.title)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Column(children: [
                                      Row(children: [
                                        Text('Nombre:',
                                            style: TextStyle(
                                                color: Constant.title,
                                                fontSize: 20)),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: RoundTextInput(
                                              color: Constant.mainCont),
                                        )
                                      ]),
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
                                              color: Constant.mainCont),
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
                                              color: Constant.mainCont),
                                        )
                                      ])),
                                    ])),
                                decoration: BoxDecoration(
                                  color: Constant.inCont,
                                  borderRadius: BorderRadius.circular(16),
                                )),
                          )
                        ],
                      )),
                  SizedBox(height: 10),
                  MainRoundedBox(
                      padding: 6,
                      width: double.infinity,
                      height: 220,
                      color: Constant.mainCont,
                      child: Column(
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: Text('Contacto de \nemergencia',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Constant.title,
                                      height: 1.5)),
                            ),
                          ),
                          Expanded(
                            child: Container(
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
                                              color: Constant.inCont),
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
                                              color: Constant.inCont),
                                        )
                                      ])),
                                    ])),
                                decoration: BoxDecoration(
                                  color: Constant.mainCont,
                                  borderRadius: BorderRadius.circular(16),
                                )),
                          ),
                        ],
                      )),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RoundTextButton(
                      child: Row(children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Siguiente',
                            style: TextStyle(
                                color: Constant.title,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        )
                      ]),
                      color: Constant.mainCont,
                      width: 110,
                      height: 50,
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}

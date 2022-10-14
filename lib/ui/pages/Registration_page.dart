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
        key: Key('RegistrationScaffold'),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(1),
              child: Column(children: [
                MainRoundedBox(
                    width: double.infinity,
                    height: 346,
                    color: Constant.mainCont,
                    child: Column(
                      children: [
                        Text('Información Personal',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 45, color: Constant.title)),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                                width: 350.0,
                                height: 80.0,
                                child: Column(children: [
                                  Expanded(
                                      child: Row(children: [
                                    Text('Nombre:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    Expanded(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ])),
                                  Expanded(
                                      child: Row(children: [
                                    Text('Edad:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    Expanded(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ])),
                                  Expanded(
                                      child: Row(children: [
                                    Text('Enfermedades:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    Expanded(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ])),
                                ])),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 117, 123, 128),
                              borderRadius: BorderRadius.circular(16),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Contacto de emergencia',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 40, color: Constant.title)),
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
                                    Expanded(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ])),
                                  Expanded(
                                      child: Row(children: [
                                    Text('Celular:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                    Expanded(
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ])),
                                ])),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 117, 123, 128),
                              borderRadius: BorderRadius.circular(16),
                            ))
                      ],
                    )),
              ]),
              decoration: BoxDecoration(
                color: Constant.mainCont,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ));
  }
}

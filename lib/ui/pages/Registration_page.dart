// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        key: Key('LoginScaffold'),
        body: SafeArea(
          child: Center(
              child: Container(
            // ignore: sort_child_properties_last
            child: SizedBox(
                width: 400.0,
                height: 150.0,
                child: Column(
                  children: [
                    Text('Información Personal',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35)),
                    Container(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                            width: 320.0,
                            height: 50.0,
                            child: Column(children: [
                              Expanded(
                                  child: Row(children: [
                                Text('Nombre:',
                                    style: TextStyle(color: Colors.white)),
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
                                    style: TextStyle(color: Colors.white)),
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
                                    style: TextStyle(color: Colors.white)),
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
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 84, 84, 84),
              borderRadius: BorderRadius.circular(25),
            ),
          )),
        ));
  }
}

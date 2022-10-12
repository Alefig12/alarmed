// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('LoginScaffold'),
        body: SafeArea(
          child: Center(
              child: Container(
            // ignore: sort_child_properties_last
            child: SizedBox(
                width: 300.0,
                height: 300.0,
                child: Column(
                  children: [
                    Text('Alarmed',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35, color: Colors.white)),
                    Text('iniciar sesión',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                    Container(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: 270.0,
                          height: 50.0,
                          child: Column(children: [
                            Expanded(
                                child: Row(children: [
                              Text('Usuario:',
                                  style: TextStyle(color: Colors.white)),
                              Expanded(
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'User',
                                  ),
                                ),
                              )
                            ])),
                            Expanded(
                                child: Row(children: [
                              Text('Contraseña:',
                                  style: TextStyle(color: Colors.white)),
                              Expanded(
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                              )
                            ]))
                          ]),
                        ),
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

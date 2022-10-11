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
                    Text('Alarmed'),
                    Text('iniciar sesión'),
                    Container(
                        child: SizedBox(
                          width: 250.0,
                          height: 50.0,
                          child: Column(children: [
                            Row(children: [
                              Text('Usuario:'),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                              )
                            ]),
                            Row(children: [
                              Text('Contraseña'),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                              )
                            ])
                          ]),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
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

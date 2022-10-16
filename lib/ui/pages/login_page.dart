// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainRoundedBox(
                  padding: 10,
                  child: Column(
                    children: [
                      Text('Alarmed',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 35, color: Colors.white)),
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
                                        style: TextStyle(color: Colors.white)),
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
                                    child: Text(
                                      'Contraseña:',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                      child: RoundTextInput(
                                          color: Constant.mainCont))
                                ])
                          ]),
                        ),
                      ),
                      RoundTextButton(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(color: Constant.title),
                            ),
                          ),
                          color: Constant.mainCont),
                      RoundTextButton(
                          width: 200,
                          radius: 10,
                          child: Text('Iniciar sesión',
                              style: TextStyle(color: Constant.title)),
                          color: Constant.inCont),
                      RoundTextButton(
                          child: Text('Crear Cuenta',
                              style: TextStyle(
                                  color: Constant.title,
                                  decoration: TextDecoration.underline)),
                          color: Constant.mainCont),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "Vincular",
                          style: TextStyle(color: Constant.title),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.grey,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.white,
                              fixedSize: Size(40, 40),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.grey,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.white,
                              fixedSize: Size(40, 40),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: Constant.mainCont,
                ),
              ),
            ],
          ),
        )));
  }
}

// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';

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
            child: MainRoundedBox(
              child: Column(
                children: [
                  Text('Alarmed',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                      child: Text('Iniciar sesión',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(9),
                      child: SizedBox(
                        width: 270.0,
                        height: 50.0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Usuario:',
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(
                                      width: 200,
                                      height: 20,
                                      child: TextField(
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          fillColor: Constant.mainCont,
                                          filled: true,
                                        ),
                                      ),
                                    )
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Contraseña:',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 180,
                                      height: 20,
                                      child: TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          fillColor: Constant.mainCont,
                                          filled: true,
                                        ),
                                      ),
                                    )
                                  ])
                            ]),
                      ),
                      decoration: BoxDecoration(
                        color: Constant.inCont,
                        borderRadius: BorderRadius.circular(16),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Constant.button),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ))),
                            onPressed: () {},
                            child: const Text(
                              "¿Olvidaste tu contraseña?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Constant.button),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              )),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Crear cuenta",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
              width: 300,
              height: 300,
            ),
          ),
        ));
  }
}

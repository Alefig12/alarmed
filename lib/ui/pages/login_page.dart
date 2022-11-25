// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/Widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:alarmed/ui/pages/Registration_page.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMesage = '';

  final AuthenticationController authenticationController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    await authenticationController.login(
        _emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('LoginScaffold'),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MainRoundedBox(
                    padding: 10,
                    child: Column(
                      children: [
                        Text('Alarmed',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 40, color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: MainRoundedBox(
                            padding: 15,
                            radius: 20,
                            color: Constant.secondCont3,
                            child: Column(children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text('Usuario:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                              RoundTextInput(
                                width: double.infinity,
                                height: 40,
                                radius: 10,
                                textController: _emailController,
                                color: Constant.mainCont,
                                textColor: Constant.secondCont4,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Contraseña:',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              RoundTextInput(
                                width: double.infinity,
                                height: 40,
                                radius: 10,
                                textController: _passwordController,
                                color: Constant.mainCont,
                                textColor: Constant.secondCont4,
                                isPassword: true,
                              )
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
                          radius: 30,
                          child: Text('Iniciar sesión',
                              style: TextStyle(
                                  color: Constant.title, fontSize: 25)),
                          color: Constant.mainCont2,
                          onPressed: login,
                        ),
                        RoundTextButton(
                            onPressed: () {
                              Get.to(RegistrationPage());
                            },
                            child: Text('Crear Cuenta',
                                style: TextStyle(
                                    color: Constant.title,
                                    decoration: TextDecoration.underline,
                                    fontSize: 20)),
                            color: Constant.mainCont),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "Vincular",
                            style:
                                TextStyle(color: Constant.title, fontSize: 20),
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
          ),
        )));
  }
}

// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:alarmed/ui/pages/login_page.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? errorMesage = '';

  final AuthenticationController authenticationController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUp() async {
    await authenticationController.signup(
        _emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: Key('RegistrationScaffold'),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                                  fontSize: 25, color: Constant.title)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(1),
                            width: double.infinity,
                            child: Column(children: [
                              Text('Nombre:',
                                  style: TextStyle(
                                      color: Constant.title, fontSize: 20)),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: RoundTextInput(
                                  color: Constant.mainCont,
                                ),
                              ),
                              Text('Edad:',
                                  style: TextStyle(
                                      color: Constant.title, fontSize: 20)),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: RoundTextInput(color: Constant.mainCont),
                              ),
                              Text('Enfermedades:',
                                  style: TextStyle(
                                      color: Constant.title, fontSize: 20)),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: RoundTextInput(color: Constant.mainCont),
                              ),
                            ]),
                            decoration: BoxDecoration(
                              color: Constant.inCont,
                              borderRadius: BorderRadius.circular(16),
                            )),
                      )
                    ],
                  )),
              SizedBox(height: 10),
              MainRoundedBox(
                  padding: 8,
                  width: double.infinity,
                  height: 250,
                  color: Constant.mainCont,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FittedBox(
                          child: Text('Contacto de \nemergencia',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40, color: Constant.title)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(1),
                            width: double.infinity,
                            child: SizedBox(
                                width: double.infinity,
                                child: Column(children: [
                                  Text('Nombre:',
                                      style: TextStyle(
                                          color: Constant.title, fontSize: 20)),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: RoundTextInput(
                                        color: Constant.mainCont),
                                  ),
                                  Text('Celular:',
                                      style: TextStyle(
                                          color: Constant.title, fontSize: 20)),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: RoundTextInput(
                                        color: Constant.mainCont),
                                  )
                                ])),
                            decoration: BoxDecoration(
                              color: Constant.inCont,
                              borderRadius: BorderRadius.circular(16),
                            )),
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: RoundTextButton(
                  child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Siguiente',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constant.title, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ]),
                  color: Constant.mainCont,
                  width: 520,
                  height: 70,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

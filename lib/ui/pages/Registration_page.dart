// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:alarmed/ui/pages/User_Password_Page.dart';
import 'package:alarmed/ui/pages/login_page.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('RegistrationScaffold'),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 10),
                    MainRoundedBox(
                        padding: 12,
                        width: double.infinity,
                        height: 300,
                        color: Constant.mainCont,
                        child: Column(
                          children: [
                            FittedBox(
                              child: Text('Información \nPersonal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 32, color: Constant.title)),
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                height: 214,
                                child: Column(children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Nombre:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  RoundTextInput(
                                    width: double.infinity,
                                    radius: 10,
                                    height: 35,
                                    color: Constant.mainCont,
                                    textColor: Constant.secondCont4,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Edad:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  RoundTextInput(
                                      width: double.infinity,
                                      radius: 10,
                                      height: 35,
                                      color: Constant.mainCont,
                                      keyboardType: TextInputType.number,
                                      textColor: Constant.secondCont4),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Enfermedades:',
                                        style: TextStyle(
                                            color: Constant.title,
                                            fontSize: 20)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  RoundTextInput(
                                      radius: 10,
                                      width: double.infinity,
                                      height: 35,
                                      color: Constant.mainCont,
                                      keyboardType: TextInputType.text,
                                      textColor: Constant.secondCont4),
                                ]),
                                decoration: BoxDecoration(
                                  color: Constant.secondCont3,
                                  borderRadius: BorderRadius.circular(16),
                                ))
                          ],
                        )),
                    SizedBox(height: 10),
                    MainRoundedBox(
                        padding: 8,
                        width: double.infinity,
                        height: 230,
                        color: Constant.mainCont,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text('Contacto de \nemergencia',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30, color: Constant.title)),
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Column(children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Nombre:',
                                            style: TextStyle(
                                                color: Constant.title,
                                                fontSize: 20)),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      RoundTextInput(
                                        color: Constant.mainCont,
                                        radius: 10,
                                        height: 35,
                                        width: double.infinity,
                                        textColor: Constant.secondCont4,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Celular:',
                                            style: TextStyle(
                                                color: Constant.title,
                                                fontSize: 20)),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      RoundTextInput(
                                        color: Constant.mainCont,
                                        radius: 10,
                                        height: 35,
                                        width: double.infinity,
                                        textColor: Constant.secondCont4,
                                        keyboardType: TextInputType.number,
                                      )
                                    ])),
                                decoration: BoxDecoration(
                                  color: Constant.secondCont3,
                                  borderRadius: BorderRadius.circular(16),
                                )),
                          ],
                        )),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: RoundTextButton(
                        onPressed: () {
                          Get.to(UserPasswordPage());
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Siguiente',
                            style:
                                TextStyle(color: Constant.title, fontSize: 40),
                          ),
                        ),
                        color: Constant.mainCont2,
                        width: 520,
                        height: 70,
                        elevation: 5,
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

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

class UserPasswordPage extends StatefulWidget {
  const UserPasswordPage({Key? key}) : super(key: key);

  @override
  State<UserPasswordPage> createState() => _UserPasswordPageState();
}

class _UserPasswordPageState extends State<UserPasswordPage> {
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
              Text(
                'Alarmed',
                style: TextStyle(fontSize: 30, color: Constant.title),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 5,
                child: MainRoundedBox(
                    padding: 15,
                    width: double.infinity,
                    height: 250,
                    color: Constant.mainCont,
                    child: Column(
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: Text('Elige tu nombre \nde usuario',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25, color: Constant.title)),
                          ),
                        ),
                        Expanded(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Podrás cambiarlo después:',
                                  style: TextStyle(
                                      color: Constant.title,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w100)),
                            ),
                            Expanded(
                              child: RoundTextInput(
                                color: Constant.secondCont3,
                                width: double.infinity,
                              ),
                            ),
                          ]),
                        )
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 9,
                child: MainRoundedBox(
                    padding: 15,
                    width: double.infinity,
                    height: 250,
                    color: Constant.mainCont,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Elige tu \ncontraseña',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 50, color: Constant.title)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(children: [
                            Text('Introduce tu contraseña:',
                                style: TextStyle(
                                    color: Constant.title,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w100)),
                            Expanded(
                              child: RoundTextInput(
                                color: Constant.secondCont3,
                                width: double.infinity,
                              ),
                            ),
                            Text('password feedback',
                                style: TextStyle(
                                    color: Constant.title,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w100)),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Confirma tu contraseña:',
                                style: TextStyle(
                                    color: Constant.title,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w100)),
                            Expanded(
                              child: RoundTextInput(
                                color: Constant.secondCont3,
                                width: double.infinity,
                              ),
                            ),
                            Text('password feedback',
                                style: TextStyle(
                                    color: Constant.title,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w100)),
                          ]),
                        )
                      ],
                    )),
              ),
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
                            color: Constant.title,
                            fontWeight: FontWeight.w400,
                            fontSize: 40),
                      ),
                    ),
                  ]),
                  color: Constant.mainCont2,
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

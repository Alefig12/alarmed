// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:alarmed/ui/pages/firebase_central.dart';
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
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPassword = true;

  void signUp() async {
    await authenticationController.signup(
        _emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: Key('RegistrationScaffold'),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alarmed',
                      style: TextStyle(fontSize: 40, color: Constant.title),
                    ),
                    SizedBox(height: 10),
                    MainRoundedBox(
                        padding: 15,
                        width: double.infinity,
                        height: 150,
                        color: Constant.mainCont,
                        child: Column(
                          children: [
                            FittedBox(
                              child: Text('Elige tu nombre \nde usuario',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Constant.title)),
                            ),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Podrás cambiarlo después:',
                                    style: TextStyle(
                                        color: Constant.title,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100)),
                              ),
                              RoundTextInput(
                                textController: _emailController,
                                color: Constant.secondCont3,
                                width: double.infinity,
                                height: 35,
                              ),
                            ])
                          ],
                        )),
                    SizedBox(height: 10),
                    MainRoundedBox(
                        padding: 15,
                        width: double.infinity,
                        height: 280,
                        color: Constant.mainCont,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text('Elige tu \ncontraseña',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30, color: Constant.title)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Introduce tu contraseña:',
                                    style: TextStyle(
                                        color: Constant.title,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100)),
                              ),
                              Row(
                                children: [
                                  RoundTextInput(
                                    textController: _passwordController,
                                    color: Constant.secondCont3,
                                    width: 280,
                                    height: 35,
                                    isPassword: _isPassword,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  RoundTextButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPassword = !_isPassword;
                                      });
                                    },
                                    child: Icon(
                                      _isPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    color: Constant.mainCont2,
                                    width: 35,
                                    height: 35,
                                    elevation: 10,
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('password feedback',
                                    style: TextStyle(
                                        color: Constant.title,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Confirma tu contraseña:',
                                    style: TextStyle(
                                        color: Constant.title,
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100)),
                              ),
                              Row(
                                children: [
                                  RoundTextInput(
                                    textController: _confirmPasswordController,
                                    color: Constant.secondCont3,
                                    width: 280,
                                    height: 35,
                                    isPassword: _isPassword,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  RoundTextButton(
                                    onPressed: () {
                                      setState(() {
                                        _isPassword = !_isPassword;
                                      });
                                    },
                                    child: Icon(
                                      _isPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    color: Constant.mainCont2,
                                    width: 35,
                                    height: 35,
                                    elevation: 10,
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('password feedback',
                                    style: TextStyle(
                                        color: Constant.title,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100)),
                              ),
                            ])
                          ],
                        )),
                    SizedBox(height: 10),
                    RoundTextButton(
                      onPressed: () {
                        signUp();
                        Get.offAll(() => FirebaseCentral());
                      },
                      child: Row(children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Siguiente',
                              style: TextStyle(
                                  color: Constant.title,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40),
                            ),
                          ),
                        ),
                      ]),
                      color: Constant.mainCont2,
                      width: 520,
                      height: 70,
                      elevation: 10,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

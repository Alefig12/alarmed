// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('InitScaffold'),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 100, 15, 0),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    // ignore: sort_child_properties_last
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Alarmed",
                          style: TextStyle(
                            color: Constant.title,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Flexible(
                            child: Text(
                          "Todo comienza cuando una alarma y un viejito no se llevaban bien entoncews tuvieron que darle de comer a mary para ser elices los pobres por las alarmas que nop djebaan que estanos esntnrbabdqan enc ifnianza.",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Constant.title, fontSize: 20),
                        ))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Constant.mainCont,
                        borderRadius: BorderRadius.circular(40))),
                Container(
                    padding: EdgeInsets.only(top: 14),
                    child: MainRoundedBox(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  CheckTerms(),
                                  Text('Acepto la política de usos de datos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  CheckTerms(),
                                  Text('Acepto los términos y condiciones',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Text('Para poder continuar debes aceptar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ]),
                        width: 280,
                        height: 120,
                        color: Constant.inCont,
                        radius: 20,
                        padding: 10)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundTextButton(
                        child: Row(children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          Text(
                            'Tutorial',
                            style: TextStyle(color: Constant.title),
                          )
                        ]),
                        color: Constant.mainCont,
                        width: 100,
                        height: 50,
                      ),
                      RoundTextButton(
                        child: Row(children: [
                          Text(
                            'Omitir',
                            style: TextStyle(color: Constant.title),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ]),
                        color: Constant.mainCont,
                        width: 100,
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }
}

class CheckTerms extends StatefulWidget {
  const CheckTerms({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckTerms> createState() => _CheckTermsState();
}

class _CheckTermsState extends State<CheckTerms> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import "package:flutter/material.dart";
import 'package:alarmed/ui/assets/constant.dart';
import 'dart:math' as math;

class ChangeFotoPage extends StatelessWidget {
  const ChangeFotoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Alarmed",
              textAlign: TextAlign.center,
              style: TextStyle(color: Constant.title, fontSize: 40),
            ),
            Expanded(
              child: Center(
                child: MainRoundedBox(
                  width: 320,
                  height: 320,
                  color: Constant.secondCont,
                  child: Column(children: [
                    Text(
                      "Escoge tu foto de perfil",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.brown.shade800,
                      child: const Text('AH'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.blue,
                            child: const Text('AH'),
                          ),
                          Text("Camara",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ]),
                        SizedBox(
                          width: 20,
                        ),
                        Column(children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.blue,
                            child: const Text('AH'),
                          ),
                          Text("Galeria",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ])
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ]),
                ),
              ),
            ),
            RoundTextButton(
              child: Text("Siguiente",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              color: Constant.mainCont2,
              width: 200,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Omitir",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    ));
  }
}

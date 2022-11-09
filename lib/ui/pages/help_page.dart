// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('HelpScaffold'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(' AYUDA',
                      style: TextStyle(
                          fontSize: 40,
                          color: Constant.title,
                          fontWeight: FontWeight.w600))),
              Align(
                alignment: Alignment.topLeft,
                child: MainRoundedBox(
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(children: [
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'Preguntas Frecuentes',
                            style: TextStyle(
                                fontSize: 15,
                                color: Constant.title,
                                fontFamily: 'Poppings'),
                          ),
                        ),
                      )
                    ]),
                    color: Constant.mainCont2,
                    width: 180,
                    height: 50),
              ),
              SizedBox(
                height: 25,
              ),
              MainRoundedBox(
                color: Constant.secondCont,
                width: 400,
                padding: 10,
                child: Column(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('¿Donde ver farmacias cercanas?',
                            style: TextStyle(
                                fontFamily: 'Poppings',
                                color: Constant.title,
                                fontSize: 25)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Sed ut perspiciatis unde omnis istee ipsa uasi archim i quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                          style: TextStyle(
                              color: Constant.title,
                              fontFamily: 'Poppings',
                              fontSize: 20))
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              MainRoundedBox(
                color: Constant.secondCont4,
                width: 400,
                padding: 10,
                child: Column(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('¿Donde ver farmacias cercanas?',
                            style: TextStyle(
                                fontFamily: 'Poppings',
                                color: Constant.secondCont2,
                                fontSize: 25)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Sed ut perspiciatis unde omnis istee ipsa uasi archim i quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                          style: TextStyle(
                              color: Constant.secondCont2,
                              fontFamily: 'Poppings',
                              fontSize: 20))
                    ],
                  )
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

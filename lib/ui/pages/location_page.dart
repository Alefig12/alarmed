// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('LocationScaffold'),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Farmacia',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Constant.title)),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: 400,
                  decoration: BoxDecoration(
                      color: Constant.secondCont,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Text(
                        'Farmacia mis cositas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Constant.title),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('Horario',
                                style: TextStyle(
                                    fontSize: 22, color: Constant.title)),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text('9:00-10:00',
                                  style: TextStyle(
                                      fontSize: 22, color: Constant.title)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('Dirección',
                                style: TextStyle(
                                    fontSize: 22, color: Constant.title)),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text('carr 545/23--q1',
                                  style: TextStyle(
                                      fontSize: 22, color: Constant.title)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text('Teléfono',
                                style: TextStyle(
                                    fontSize: 22, color: Constant.title)),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text('10393785',
                                  style: TextStyle(
                                      fontSize: 22, color: Constant.title)),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                  decoration: BoxDecoration(
                      color: Constant.secondCont,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

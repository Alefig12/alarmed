import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const Key('AlarmScaffold'),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Constant.secondCont,
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('CONFIGURACION DE ALARMAS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Constant.inCont)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Here start the pills
                      Container(
                        decoration: BoxDecoration(
                            color: Constant.secondCont,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Image(
                                    image: AssetImage('images/pill.png')),
                              ],
                            )),
                      ),
                    ]))));
  }
}

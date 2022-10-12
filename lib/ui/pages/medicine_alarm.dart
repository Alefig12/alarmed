import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MedicineAlarm extends StatefulWidget {
  const MedicineAlarm({Key? key}) : super(key: key);

  @override
  State<MedicineAlarm> createState() => _MedicineAlarmState();
}

class _MedicineAlarmState extends State<MedicineAlarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('MedicineAlarmScaffold'),
      body: Center(
          child: Stack(alignment: AlignmentDirectional.topEnd,
              // ignore: sort_child_properties_last
              children: [
            Container(
              color: Colors.white,
              alignment: Alignment(0, 0),
              child: Container(
                height: 400,
                width: 400,
                color: Color.fromARGB(255, 84, 84, 84),
                child: Text('Programa tus medicinas!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40)),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(Icons.print),
                    Icon(
                      Icons.medical_information,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                )),
          ])),
    );
  }
}

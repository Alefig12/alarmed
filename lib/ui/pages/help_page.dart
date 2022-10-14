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
        child: Column(children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
          ),
          SizedBox(
            height: 40,
          ),
          Text('AYUDA',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 35, color: Colors.black)),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: RoundTextButton(
                child: Row(children: [
                  Text(
                    'Preguntas Frecuentes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 92, 91, 91)),
                  ),
                ]),
                color: Color.fromARGB(255, 188, 187, 187),
                width: 170,
                height: 50,
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
              child: Align(
                  alignment: Alignment.topLeft,
                  child: MainRoundedBox(
                    color: Constant.secondCont,
                    height: 100,
                    width: 400,
                    child: Column(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('¿Donde ver farmacias cercanas?',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Lorem ipsum')
                        ],
                      ),
                    ]),
                  ))),
          SizedBox(height: 20),
          Container(
              child: MainRoundedBox(
            color: Constant.secondCont,
            height: 100,
            width: 400,
            child: Column(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('¿Donde cambiar el nombre de usuario?',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Lorem ipsum ')
                ],
              )
            ]),
          )),
        ]),
      ),
    );
  }
}

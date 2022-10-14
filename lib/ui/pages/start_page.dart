import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('StartScaffold'),
        body: SafeArea(
            child: Center(
                child: Container(
                    padding: const EdgeInsets.all(1),
                    child: Column(
                      children: [
                        MainRoundedBox(
                            width: double.infinity,
                            color: Constant.mainCont,
                            child: Column(
                              children: [
                                Text('Alarmed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 45, color: Constant.title)),
                                Text('data')
                              ],
                            ))
                      ],
                    )))));
  }
}

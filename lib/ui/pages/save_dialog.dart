import 'package:alarmed/ui/assets/constant.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:flutter/material.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog({Key? key, required this.onContinueClick}) : super(key: key);
  final Function() onContinueClick;

  @override
  Widget build(BuildContext context) {
    return MainRoundedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 3,
        color: Constant.mainCont,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Expanded(
                child: FittedBox(
                  child: Text(
                    "Atención",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Expanded(
                  child: FittedBox(
                child: Text(
                  '¿Estas segur@ de los cambios?',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundTextButton(
                        color: Constant.mainCont,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const FittedBox(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )),
                    RoundTextButton(
                        color: Colors.white,
                        onPressed: () {
                          onContinueClick();
                          Navigator.of(context).pop();
                        },
                        child: FittedBox(
                          child: Text(
                            "Guardar",
                            style: TextStyle(
                                color: Constant.mainCont,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

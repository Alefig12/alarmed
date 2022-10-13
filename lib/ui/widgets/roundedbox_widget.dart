import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class MainRoundedBox extends StatelessWidget {
  const MainRoundedBox({
    Key? key,
    required this.child,
    required this.color,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius ?? 25),
      ),
      child: SizedBox(
        //Si width = null,pone 50. Si width != null , pone height
        width: width ?? 50,

        //Si height = null,pone 50. Si height != null , pone height
        height: height ?? 50,

        child: child,
      ),
    );
  }
}

class RoundTextButton extends StatelessWidget {
  const RoundTextButton(
      {Key? key,
      required this.text,
      required this.color,
      this.width,
      this.height,
      this.radius})
      : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final Text text;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        //Si width = null,pone 50. Si width != null , pone height
        width: width ?? 50,

        //Si height = null,pone 50. Si height != null , pone height
        height: height ?? 50,

        child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Constant.button),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 25),
              )),
            ),
            onPressed: () {},
            child: text),
      ),
    );
  }
}

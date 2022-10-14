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
      required this.child,
      required this.color,
      this.width,
      this.height,
      this.radius,
      this.onPressed})
      : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final double? radius;
  final void Function()? onPressed;

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
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 25),
              )),
            ),
            onPressed: onPressed ?? () {},
            child: child),
      ),
    );
  }
}

class RoundTextInput extends StatelessWidget {
  const RoundTextInput({
    Key? key,
    required this.color,
    this.width,
    this.height,
    this.radius,
    this.isPassword,
    this.label,
    this.hintStyle,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color color;
  final double? radius;
  final bool? isPassword;
  final String? label;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: height ?? 20,
      child: TextField(
        textAlign: TextAlign.left,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: label ?? '',
          hintStyle: hintStyle ?? const TextStyle(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: color,
          filled: true,
        ),
      ),
    );
  }
}

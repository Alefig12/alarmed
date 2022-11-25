import 'package:alarmed/ui/assets/constant.dart';
import 'package:flutter/material.dart';

class MainRoundedBox extends StatelessWidget {
  const MainRoundedBox(
      {Key? key,
      required this.child,
      required this.color,
      this.width,
      this.height,
      this.radius,
      this.padding,
      this.shadowColor})
      : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final double? radius;
  final double? padding;
  final Color? shadowColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius ?? 25),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Color.fromARGB(0, 33, 29, 42),
            blurRadius: 5,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: SizedBox(
        //Si width = null,pone 50. Si width != null , pone width
        width: width,

        //Si height = null,pone 50. Si height != null , pone height
        height: height,

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
      this.elevation,
      this.onPressed})
      : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final double? radius;
  final double? elevation;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        //Si width = null,pone 50. Si width != null , pone height
        width: width,

        //Si height = null,pone 50. Si height != null , pone height
        height: height,

        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              elevation:
                  MaterialStateProperty.all(elevation ?? 0), //Defines Elevation
              shadowColor: MaterialStateProperty.all(Colors.black),
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
  const RoundTextInput(
      {Key? key,
      required this.color,
      this.textColor,
      this.width,
      this.height,
      this.radius,
      this.isPassword,
      this.label,
      this.hintStyle,
      this.textController})
      : super(key: key);

  final double? width;
  final double? height;
  final Color color;
  final Color? textColor;
  final double? radius;
  final bool? isPassword;
  final String? label;
  final TextStyle? hintStyle;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: height ?? 20,
      child: TextField(
        style: TextStyle(color: textColor ?? Colors.black),
        controller: textController,
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

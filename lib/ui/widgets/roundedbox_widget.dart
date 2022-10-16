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
    this.padding,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final double? radius;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius ?? 25),
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
        width: width,

        //Si height = null,pone 50. Si height != null , pone height
        height: height,

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
  const RoundTextInput(
      {Key? key,
      required this.color,
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

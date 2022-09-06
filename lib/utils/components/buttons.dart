import 'package:flutter/material.dart';

import '../constants/color.dart';

class CustomTextButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final double? buttonRadius;

  const CustomTextButton({
    Key? key,
    required this.child,
    this.color,
    this.onPressed,
    this.buttonRadius,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? null,
      style: ButtonStyle(
        // side: MaterialStateProperty.all(BorderSide(color: borderColor ?? color!)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius ?? 10)),
        ),
        backgroundColor: MaterialStateProperty.all(color ?? primaryColor),
      ),
      child: child,
    );
  }
}

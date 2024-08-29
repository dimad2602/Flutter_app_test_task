import 'package:flutter/material.dart';

class SignInFilledButtonWidget extends StatelessWidget {
  final Widget text;
  final Color? color;
  final VoidCallback? onPressed;
  const SignInFilledButtonWidget(
      {super.key, required this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: text);
  }
}

import 'package:flutter/material.dart';
import 'package:test_task/utils/app_colors.dart';

class SignInTextFieldWidget extends StatefulWidget {
  final String? labelText;
  final String? helperText;
  final Icon? icon;
  final TextEditingController? controller;
  final bool hiddenText;
  final String obscuringCharacter;
  final Icon? trailingIcon;
  final TextInputType? keyboardType;
  const SignInTextFieldWidget({
    super.key,
    this.labelText,
    this.icon,
    required this.controller,
    this.hiddenText = false,
    this.helperText = "",
    this.obscuringCharacter = "*",
    this.trailingIcon = const Icon(Icons.cancel_outlined),
    this.keyboardType,
  });

  @override
  State<SignInTextFieldWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<SignInTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.hiddenText,
      obscuringCharacter: widget.obscuringCharacter,
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: widget.icon,
        suffixIcon: widget.controller!.text.isNotEmpty
            ? IconButton(
                icon: widget.trailingIcon!,
                onPressed: () {
                  setState(() {
                    widget.controller!.clear();
                  });
                },
              )
            : const SizedBox(),
        fillColor: AppColors.textFieldColor,
        filled: true,
        labelText: widget.labelText,
        helperText: widget.helperText,
      ),
      keyboardType: widget.keyboardType ?? TextInputType.text,
    );
  }
}

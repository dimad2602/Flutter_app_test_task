import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  final bool bold;
  final int? maxLines;
  final bool appbar;

  const SmallText({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
    this.bold = false,
    this.maxLines = 1,
    this.appbar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: appbar
              ? 16
              : size == 0
                  ? 14
                  : size,
          fontWeight: bold == false ? FontWeight.w400 : FontWeight.bold),
    );
  }
}

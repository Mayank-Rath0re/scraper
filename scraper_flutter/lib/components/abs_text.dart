import 'package:flutter/material.dart';

class AbsText extends StatelessWidget {
  final String displayText;
  final double fontSize;
  final bool bold;
  const AbsText(
      {super.key,
      required this.displayText,
      required this.fontSize,
      this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

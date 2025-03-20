import 'package:flutter/material.dart';

class AbsBox extends StatelessWidget {
  final Color color;
  final String text;
  const AbsBox({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 100,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Text(text),
    );
  }
}

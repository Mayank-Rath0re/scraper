import 'package:flutter/material.dart';

class AbsButton extends StatefulWidget {
  final String text;
  final Icon icon;
  final Function()? onPressed;
  final bool alignStart;
  const AbsButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed,
      this.alignStart = false});

  @override
  State<AbsButton> createState() => _AbsButtonState();
}

class _AbsButtonState extends State<AbsButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)))),
        child: Align(
            alignment:
                widget.alignStart ? Alignment.centerLeft : Alignment.center,
            child: Row(
              children: [
                widget.icon,
                Text(
                  widget.text,
                  style: TextStyle(color: Colors.black),
                )
              ],
            )));
  }
}

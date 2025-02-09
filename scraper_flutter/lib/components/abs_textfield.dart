import 'package:flutter/material.dart';

class AbsTextfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function()? onTap;
  const AbsTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.onTap,
  });

  @override
  State<AbsTextfield> createState() => _AbsTextfieldState();
}

class _AbsTextfieldState extends State<AbsTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: widget.hintText,
      ),
      onChanged: (val) {
        setState(() {
          widget.controller.text = val;
        });
      },
      onTap: widget.onTap,
    );
  }
}

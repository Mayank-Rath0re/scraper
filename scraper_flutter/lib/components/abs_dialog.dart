import 'package:flutter/material.dart';

class AbsDialog extends StatefulWidget {
  final String message;
  final Color color;
  const AbsDialog(
      {super.key, required this.message, this.color = Colors.green});

  @override
  State<AbsDialog> createState() => _AbsDialogState();
}

class _AbsDialogState extends State<AbsDialog> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    position = Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: position,
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.topCenter,
          content: Row(children: [
            Expanded(
                flex: 4,
                child: Row(children: [
                  Icon(Icons.circle, color: widget.color),
                  const SizedBox(width: 5),
                  Text(widget.message)
                ])),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close_rounded)))
          ]),
        ));
  }
}

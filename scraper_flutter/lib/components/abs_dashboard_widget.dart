import 'package:flutter/material.dart';

class AbsDashboardWidget extends StatefulWidget {
  final String widgetTitle;
  final String displayData;
  const AbsDashboardWidget(
      {super.key, required this.widgetTitle, required this.displayData});

  @override
  State<AbsDashboardWidget> createState() => _AbsDashboardWidgetState();
}

class _AbsDashboardWidgetState extends State<AbsDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.widgetTitle,
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 20),
          Container(
              alignment: Alignment.center,
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.grey.shade700)),
              child: Text(widget.displayData, style: TextStyle(fontSize: 40)))
        ],
      ),
    );
  }
}

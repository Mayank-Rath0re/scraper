import 'package:flutter/material.dart';
import 'package:scrap_client/scrap_client.dart';
import 'package:scrap_flutter/components/abs_box.dart';

class AbsExtract extends StatefulWidget {
  final DBProcess processData;
  const AbsExtract({super.key, required this.processData});

  @override
  State<AbsExtract> createState() => _AbsExtractState();
}

Color statusColor(String status) {
  if (status == "Completed") {
    return Colors.blue;
  } else if (status == "Running") {
    return Colors.green;
  } else if (status == "Inactive") {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}

class _AbsExtractState extends State<AbsExtract> {
  @override
  Widget build(BuildContext context) {
    bool isCompleted = widget.processData.status == "Completed" ? true : false;
    return Container(
        constraints: BoxConstraints(minHeight: 30, maxHeight: 40),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: AbsBox(
                    color: Colors.grey.shade300,
                    text: widget.processData.niche)),
            const SizedBox(width: 15),
            Expanded(
                flex: 2,
                child: AbsBox(
                    color: Colors.grey.shade300,
                    text: widget.processData.location)),
            const SizedBox(width: 15),
            Expanded(
                flex: 2,
                child: AbsBox(
                    color: statusColor(widget.processData.status),
                    text: widget.processData.status)),
            const SizedBox(width: 15),
            if (isCompleted) ...[
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        // To be coded later
                      },
                      icon: Icon(Icons.cloud_download_rounded,
                          color: Colors.blue)))
            ] else ...[
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        // Placeholder Button
                        // Should pop dialog
                      },
                      icon: Icon(Icons.file_download_off_outlined)))
            ]
          ],
        ));
  }
}

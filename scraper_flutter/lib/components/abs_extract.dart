import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_box.dart';
import 'package:scraper_flutter/components/abs_dialog.dart';
import 'package:scraper_flutter/main.dart';

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
  Future<void> downloadFile(DBProcess process) async {
    ByteData? fileData = await client.scrape.retrieveSingleData(process.id);
    Uint8List bytes = fileData!.buffer.asUint8List();
    final blob = html.Blob([bytes]);
    // Create anchor tag
    final downloadUrl = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: downloadUrl)
      ..target = "blank"
      ..download = "${process.niche}in${process.location}.csv";
    // Trigger the download
    anchor.click();
    // Revoke the object url after download starts
    html.Url.revokeObjectUrl(downloadUrl);
  }

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
                        downloadFile(widget.processData);
                        // Show Dialog for successful dialog
                        showDialog(
                            context: context,
                            builder: (context) => AbsDialog(
                                message: "File Downloaded Successfully",
                                color: Colors.green));
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

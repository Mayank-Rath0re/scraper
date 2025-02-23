import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_text.dart';
import 'package:scraper_flutter/main.dart';

class AbsInfoDialog extends StatefulWidget {
  final DBScrapers? scraper;
  const AbsInfoDialog({super.key, required this.scraper});

  @override
  State<AbsInfoDialog> createState() => _AbsEndDrawerState();
}

class _AbsEndDrawerState extends State<AbsInfoDialog> {
  Future<void> downloadFile(DBScrapers scraper) async {
    ByteData? fileData = await client.scrape.retrieveRar(scraper.id);
    Uint8List bytes = fileData!.buffer.asUint8List();
    final blob = html.Blob([bytes]);
    // Create anchor tag
    final downloadUrl = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: downloadUrl)
      ..target = "blank"
      ..download = "scraper-${scraper.id}.zip";
    // Trigger the download
    anchor.click();
    // Revoke the object url after download starts
    html.Url.revokeObjectUrl(downloadUrl);
  }

  int completed = 0;
  void getCompleteCount() async {
    int tempCount = await client.scrape.statusCount(widget.scraper!.id ?? 0);
    setState(() {
      completed = tempCount;
    });
  }

  @override
  void initState() {
    getCompleteCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.scraper == null) {
      return Center(child: Text("Invalid Scraper"));
    } else {
      return SizedBox(
        width: 600,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  const Spacer(),
                  const SizedBox(width: 10),
                  if (widget.scraper!.status == "Completed") ...[
                    IconButton(
                        onPressed: () {
                          downloadFile(widget.scraper!);
                        },
                        icon: Icon(Icons.cloud_download, color: Colors.blue))
                  ],
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  AbsText(displayText: "ID: ", fontSize: 15, bold: true),
                  const SizedBox(width: 10),
                  AbsText(displayText: "${widget.scraper!.id}", fontSize: 14)
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  AbsText(displayText: "Status: ", fontSize: 16, bold: true),
                  const SizedBox(width: 10),
                  AbsText(displayText: widget.scraper!.status, fontSize: 14)
                ],
              ),
              const SizedBox(height: 15),
              AbsText(displayText: "Created at: ", fontSize: 18, bold: true),
              const SizedBox(height: 10),
              AbsText(
                  displayText: "${widget.scraper!.createdAt}", fontSize: 15),
              const SizedBox(height: 15),
              AbsText(displayText: "Niche", fontSize: 18, bold: true),
              const SizedBox(height: 10),
              AbsText(displayText: "${widget.scraper!.niche}", fontSize: 15),
              const SizedBox(height: 15),
              AbsText(displayText: "Locations", fontSize: 18, bold: true),
              const SizedBox(height: 10),
              AbsText(displayText: "${widget.scraper!.location}", fontSize: 15),
              const SizedBox(height: 30),
              AbsText(displayText: "Progress", fontSize: 20, bold: true),
              const SizedBox(height: 10),
              Row(
                children: [
                  AbsText(
                      displayText:
                          "$completed/${widget.scraper!.processCount} Queries Scraped",
                      fontSize: 15),
                  const Spacer(),
                  AbsText(
                      displayText:
                          "${completed * 100 / widget.scraper!.processCount}% Completed",
                      fontSize: 15),
                ],
              ),
              const SizedBox(height: 15),
              LinearPercentIndicator(
                lineHeight: 10,
                backgroundColor: Colors.grey.shade400,
                progressColor: Colors.blue,
                percent: completed / widget.scraper!.processCount,
              ),
            ],
          ),
        ),
      );
    }
  }
}

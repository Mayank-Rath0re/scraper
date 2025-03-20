import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_box.dart';
import 'package:scraper_flutter/components/abs_text.dart';

class AbsEmailVerbox extends StatefulWidget {
  final DBEmail emailProcess;
  const AbsEmailVerbox({super.key, required this.emailProcess});

  @override
  State<AbsEmailVerbox> createState() => _AbsEmailVerboxState();
}

class _AbsEmailVerboxState extends State<AbsEmailVerbox> {
  Color getStatusColor(String status) {
    if (status == "Inactive") {
      return Colors.yellow;
    } else if (status == "Error") {
      return Colors.red;
    } else if (status == "Completed") {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    int scraperId = widget.emailProcess.scraperId;
    int totalProcess = widget.emailProcess.processIds.length;
    String status = widget.emailProcess.status;
    return Row(
      children: [
        Expanded(child: AbsBox(color: Colors.grey, text: "$scraperId")),
        const SizedBox(width: 10),
        Expanded(child: AbsBox(color: getStatusColor(status), text: status)),
        const SizedBox(width: 10),
        Expanded(
            child: GestureDetector(
          child: AbsBox(color: Colors.blue.shade200, text: "Info"),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Container(
                        constraints:
                            BoxConstraints(minWidth: 500, minHeight: 600),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  AbsText(
                                      displayText: "ID: ",
                                      fontSize: 15,
                                      bold: true),
                                  const SizedBox(width: 10),
                                  AbsText(
                                      displayText:
                                          "${widget.emailProcess.scraperId}",
                                      fontSize: 14)
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  AbsText(
                                      displayText: "Status: ",
                                      fontSize: 15,
                                      bold: true),
                                  const SizedBox(width: 10),
                                  AbsText(
                                      displayText:
                                          // ignore: unnecessary_string_interpolations
                                          "${widget.emailProcess.status}",
                                      fontSize: 14)
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  AbsText(
                                      displayText: "Total Processes: ",
                                      fontSize: 15,
                                      bold: true),
                                  const SizedBox(width: 10),
                                  AbsText(
                                      displayText:
                                          "${widget.emailProcess.processIds.length}",
                                      fontSize: 14)
                                ],
                              ),
                              Row(
                                children: [
                                  AbsText(
                                      displayText:
                                          // ignore: unnecessary_brace_in_string_interps
                                          "${widget.emailProcess.completed}/${totalProcess} Queries Scraped",
                                      fontSize: 15),
                                  const Spacer(),
                                  AbsText(
                                      displayText:
                                          "${widget.emailProcess.completed * 100 / totalProcess}% Completed",
                                      fontSize: 15),
                                ],
                              ),
                              const SizedBox(height: 15),
                              LinearPercentIndicator(
                                lineHeight: 10,
                                backgroundColor: Colors.grey.shade400,
                                progressColor: Colors.blue,
                                percent: widget.emailProcess.completed /
                                    totalProcess,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
          },
        )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_box.dart';
import 'package:scraper_flutter/components/abs_dialog.dart';
import 'package:scraper_flutter/components/abs_info_dialog.dart';
import 'package:scraper_flutter/main.dart';

class AbsScraper extends StatefulWidget {
  final DBScrapers scraper;
  const AbsScraper({super.key, required this.scraper});

  @override
  State<AbsScraper> createState() => _AbsScraperState();
}

class _AbsScraperState extends State<AbsScraper> {
  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.green;
    if (widget.scraper.status == "Idle") {
      statusColor = Colors.yellow;
    } else if (widget.scraper.status == "Error") {
      statusColor = Colors.red;
    } else if (widget.scraper.status == "Completed") {
      statusColor = Colors.blue;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            height: 40,
            width: 200,
            child: AbsBox(color: Colors.grey, text: "${widget.scraper.id}")),
        SizedBox(
            height: 40,
            width: 200,
            child: AbsBox(
                color: Colors.grey,
                text: widget.scraper.niche.length == 1
                    ? widget.scraper.niche[0]
                    : "Diversified")),
        SizedBox(
            height: 40,
            width: 200,
            child: AbsBox(color: statusColor, text: widget.scraper.status)),
        GestureDetector(
            // Seems to be wrong but we'll see XD
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: AbsInfoDialog(scraper: widget.scraper),
                      ));
            },
            child: SizedBox(
                height: 40,
                width: 200,
                child: AbsBox(color: Colors.blue.shade300, text: "Info"))),
        SizedBox(
            height: 40,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stop Scraper
                ElevatedButton(
                    onPressed: () async {
                      if (widget.scraper.status != "Active") {
                        // Show notification that process is not running
                        showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) {
                              return AbsDialog(
                                  message: "CAN'T PAUSE - SCRAPER NOT RUNNING",
                                  color: Colors.yellow);
                            });
                      } else {
                        int stopping =
                            await client.scrape.stopProcess(widget.scraper);
                        if (stopping == 1) {
                          // Scraping Stopped Successfully
                          setState(() {
                            // Empty for now, should work fine
                          });
                        } else if (stopping == 0) {
                          // Error
                          showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) {
                                return AbsDialog(
                                    message: "Error Stopping Scraper",
                                    color: Colors.red);
                              });
                        } else {
                          // Error - invalid input
                          showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) {
                                return AbsDialog(
                                  message: "Invalid Input",
                                  color: Colors.yellow,
                                );
                              });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(90, 50),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: AbsBox(color: Colors.transparent, text: "Stop")),
                // Pause Scraper
                ElevatedButton(
                    onPressed: () async {
                      if (widget.scraper.status != "Active") {
                        // Show notification for process not running
                        showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) {
                              return AbsDialog(
                                  message: "CAN'T PAUSE - SCRAPER NOT RUNNING",
                                  color: Colors.yellow);
                            });
                      } else {
                        int pausing =
                            await client.scrape.pauseProcess(widget.scraper);
                        if (pausing == 1) {
                          // Scraping paused successfully
                          setState(() {
                            // Empty for now, should work fine
                          });
                        } else if (pausing == 0) {
                          // Error
                          showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) {
                                return AbsDialog(
                                    message: "Error Pausing Scraper",
                                    color: Colors.red);
                              });
                        } else {
                          // Error - Invalid Input
                          showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (context) {
                                return AbsDialog(
                                    message: "Invalid Input",
                                    color: Colors.yellow);
                              });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(90, 50),
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: AbsBox(color: Colors.transparent, text: "Pause")),
                // Start Scraper
                ElevatedButton(
                    onPressed: () async {
                      if (widget.scraper.status == "Active") {
                        // Show notification for process already running
                      } else if (widget.scraper.status == "Completed") {
                        // Dialog for scraper already completed
                        showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) {
                              return AbsDialog(
                                  message: "Scraper already completed!",
                                  color: Colors.blue);
                            });
                      } else {
                        // Start/Resume scraping
                        setState(() {
                          client.scrape.startScraping(widget.scraper);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(90, 50),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: AbsBox(color: Colors.transparent, text: "Start"))
              ],
            )),
      ],
    );
  }
}

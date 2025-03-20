import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:scraper_flutter/components/abs_button.dart';
import 'package:scraper_flutter/components/abs_dialog.dart';
import 'package:scraper_flutter/components/abs_text.dart';
import 'package:scraper_flutter/components/abs_textfield.dart';
import 'package:scraper_flutter/main.dart';
import 'package:scraper_flutter/models/cache_query.dart';

class Queries extends StatefulWidget {
  const Queries({super.key});

  @override
  State<Queries> createState() => _QueriesState();
}

class _QueriesState extends State<Queries> {
  TextEditingController nicheController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController bulkNicheController = TextEditingController();
  TextEditingController bulkLocationController = TextEditingController();
  CacheQuery queries = CacheQuery();

  void bulkFieldNiche() {
    List<String> niches = bulkNicheController.text.split("\n");
    List<String> finalNiches = [];
    for (int i = 0; i < niches.length; i++) {
      if (queries.niche.contains(niches[i])) {
        continue;
      }
      finalNiches.add(niches[i]);
    }
    setState(() {
      queries.niche.addAll(finalNiches);
      bulkNicheController.clear();
    });
  }

  void bulkFileNiche() async {
    List<String> fileNiches = [];
    String temp = "";
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["txt"]);
    if (result != null) {
      Uint8List fileBytes = result.files.single.bytes!;
      String content = String.fromCharCodes(fileBytes);
      for (int i = 0; i < content.length; i++) {
        if (content[i] != "\n") {
          temp += content[i];
        } else {
          temp = temp.trim();
          if (queries.niche.contains(temp)) {
            continue;
          }
          fileNiches.add(temp);
          temp = "";
        }
      }
      if (temp.isNotEmpty) {
        fileNiches.add(temp);
        temp = "";
      }
      queries.niche.addAll(fileNiches);
      print(queries.niche);
      setState(() {
        Navigator.pop(context);
      });
    } else {
      // Do nothing
    }
  }

  void bulkFieldLocation() {
    List<String> locations = bulkLocationController.text.split("\n");
    List<String> finalLocations = [];
    for (int i = 0; i < locations.length; i++) {
      if (queries.locations.contains(locations[i])) {
        continue;
      }
      finalLocations.add(locations[i]);
    }
    setState(() {
      queries.locations.addAll(finalLocations);
      bulkLocationController.clear();
    });
  }

  void bulkFileLocation() async {
    String temp = "";
    List<String> fileLocations = [];
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["txt"]);
    if (result != null) {
      Uint8List fileBytes = result.files.single.bytes!;
      String content = String.fromCharCodes(fileBytes);
      for (int i = 0; i < content.length; i++) {
        if (content[i] != "\n") {
          temp += content[i];
        } else {
          temp = temp.trim();
          if (queries.locations.contains(temp)) {
            continue;
          }
          fileLocations.add(temp);
          temp = "";
        }
      }
      if (temp.isNotEmpty) {
        fileLocations.add(temp);
        temp = "";
      }
      queries.locations.addAll(fileLocations);
      setState(() {
        Navigator.pop(context);
      });
    } else {
      // Do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          AppBar(
            actions: [
              AbsButton(
                  text: "Queue Scraper",
                  icon: Icon(Icons.queue, color: Colors.black),
                  onPressed: () {
                    // Condition 1: Data should not be empty
                    if (queries.nicheIsEmpty() || queries.locationIsEmpty()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AbsDialog(
                              message: "Empty Fields not accepted",
                              color: Colors.yellow,
                            );
                          });
                    }
                    // Otherwise, put scraper in queue
                    else {
                      try {
                        client.scrape.startNewScrape(
                            queries.niche, queries.locations,
                            mode: "queue");
                        setState(() {
                          // Reload the page to empty all constraints
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AbsDialog(
                                    message: "Scraper Added to Queue");
                              });
                          nicheController.clear();
                          locationController.clear();
                          queries.flushData();
                        });
                      } on Exception catch (_) {
                        // Dialog for error
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AbsDialog(
                                message: "Error Starting Scraping",
                                color: Colors.red,
                              );
                            });
                      }
                    }
                  }),
              AbsButton(
                  text: "Start Scraping",
                  icon: Icon(
                    Icons.settings_suggest_rounded,
                    color: Colors.black,
                  ),
                  // Most Important function of the tab
                  onPressed: () {
                    // Condition 1: Data should not be empty
                    if (queries.nicheIsEmpty() || queries.locationIsEmpty()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AbsDialog(
                              message: "Empty Fields not accepted",
                              color: Colors.yellow,
                            );
                          });
                    }
                    // Otherwise, start scraping
                    else {
                      try {
                        client.scrape.startNewScrape(
                            queries.niche, queries.locations,
                            mode: "start");
                        setState(() {
                          // Reload the page to empty all constraints
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AbsDialog(
                                    message: "Started Scraping Successfully");
                              });
                          nicheController.clear();
                          locationController.clear();
                          queries.flushData();
                        });
                      } on Exception catch (_) {
                        // Dialog for error
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AbsDialog(
                                message: "Error Starting Scraping",
                                color: Colors.red,
                              );
                            });
                      }
                    }
                  })
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                constraints: BoxConstraints(minWidth: 300, maxWidth: 400),
                decoration: BoxDecoration(border: Border.all(width: 3)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Niche",
                            style: TextStyle(fontSize: 25),
                          ),
                          const Spacer(),
                          AbsButton(
                              text: "Bulk Upload",
                              icon: Icon(
                                Icons.file_upload_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  bulkFieldNiche();
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel",
                                                    style: TextStyle(
                                                        color: Colors.black)))
                                          ],
                                          content: Container(
                                              constraints: BoxConstraints(
                                                  minHeight: 300,
                                                  maxHeight: 400,
                                                  minWidth: 400,
                                                  maxWidth: 400),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  children: [
                                                    // Upload File Button
                                                    AbsText(
                                                        displayText:
                                                            "The file must be a .txt file with one niche per line",
                                                        fontSize: 14),
                                                    const SizedBox(height: 10),
                                                    AbsButton(
                                                        text:
                                                            "    Upload data file",
                                                        icon: Icon(
                                                            Icons
                                                                .upload_file_rounded,
                                                            color:
                                                                Colors.black),
                                                        onPressed:
                                                            bulkFileNiche),
                                                    const SizedBox(height: 10),
                                                    // Or Text
                                                    AbsText(
                                                        displayText: "Or",
                                                        fontSize: 14),
                                                    const SizedBox(height: 12),
                                                    // Multi-line TextField constrained inside box
                                                    TextField(
                                                      maxLines: 10,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Niches - one per line"),
                                                      controller:
                                                          bulkNicheController,
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ));
                              })
                        ],
                      ),
                      const SizedBox(height: 15),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: queries.niche.length,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(queries.niche[index]),
                                trailing: GestureDetector(
                                  child: Icon(Icons.delete_outline),
                                  onTap: () {
                                    setState(() {
                                      queries.removeNiche(index);
                                    });
                                  },
                                ),
                              )),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: AbsTextfield(
                                  hintText: "niche",
                                  controller: nicheController)),
                          const SizedBox(width: 7),
                          Expanded(
                              child: AbsButton(
                                  text: "",
                                  icon: Icon(Icons.add, color: Colors.black),
                                  alignStart: true,
                                  onPressed: () {
                                    if (nicheController.text == "") {
                                      // No string passed
                                    } else if (queries
                                        .containsNiche(nicheController.text)) {
                                      // Show Dialog
                                    } else {
                                      setState(() {
                                        queries.addNiche(nicheController.text);
                                        nicheController.clear();
                                      });
                                    }
                                  }))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(minWidth: 300, maxWidth: 400),
                  decoration: BoxDecoration(border: Border.all(width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Locations",
                              style: TextStyle(fontSize: 25),
                            ),
                            const Spacer(),
                            AbsButton(
                                text: "Bulk Upload",
                                icon: Icon(
                                  Icons.file_upload_outlined,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    bulkFieldLocation();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Submit",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel",
                                                      style: TextStyle(
                                                          color: Colors.black)))
                                            ],
                                            content: Container(
                                                constraints: BoxConstraints(
                                                    minHeight: 300,
                                                    maxHeight: 400,
                                                    minWidth: 400,
                                                    maxWidth: 400),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    children: [
                                                      // Upload File Button
                                                      AbsText(
                                                          displayText:
                                                              "The file must be a .txt file with one location per line",
                                                          fontSize: 14),
                                                      const SizedBox(
                                                          height: 10),
                                                      AbsButton(
                                                          text:
                                                              "    Upload data file",
                                                          icon: Icon(
                                                              Icons
                                                                  .upload_file_rounded,
                                                              color:
                                                                  Colors.black),
                                                          onPressed:
                                                              bulkFileLocation),
                                                      const SizedBox(
                                                          height: 10),
                                                      // Or Text
                                                      AbsText(
                                                          displayText: "Or",
                                                          fontSize: 14),
                                                      const SizedBox(
                                                          height: 12),
                                                      // Multi-line TextField constrained inside box
                                                      TextField(
                                                        maxLines: 10,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "locations - one per line"),
                                                        controller:
                                                            bulkLocationController,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ));
                                })
                          ],
                        ),
                        const SizedBox(height: 15),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: queries.locations.length,
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(queries.locations[index]),
                                  trailing: GestureDetector(
                                      child: Icon(Icons.delete_outline),
                                      onTap: () {
                                        setState(() {
                                          queries.removeLocation(index);
                                        });
                                      }),
                                )),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: AbsTextfield(
                                    hintText: "location",
                                    controller: locationController)),
                            const SizedBox(width: 7),
                            Expanded(
                                child: AbsButton(
                                    text: "",
                                    icon: Icon(Icons.add, color: Colors.black),
                                    alignStart: true,
                                    onPressed: () {
                                      if (locationController.text == "") {
                                        // No string passed
                                      } else if (queries.containsLocation(
                                          locationController.text)) {
                                        // Show Dialog
                                      } else {
                                        setState(() {
                                          queries.addLocation(
                                              locationController.text);
                                          locationController.clear();
                                        });
                                      }
                                    }))
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

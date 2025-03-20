import 'package:flutter/material.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_box.dart';
import 'package:scraper_flutter/components/abs_extract.dart';
import 'package:scraper_flutter/components/abs_textfield.dart';
import 'package:scraper_flutter/main.dart';

class Extraction extends StatefulWidget {
  const Extraction({super.key});

  @override
  State<Extraction> createState() => _ExtractionState();
}

class _ExtractionState extends State<Extraction> {
  List<DBProcess> processBuild = [];
  List<DBProcess> tempProcessBuild = [];

  void getRunningProcess() async {
    try {
      final List<DBProcess> process =
          await client.extract.retrieveByStatus("Running");
      setState(() {
        processBuild = process;
      });
    } catch (err) {
      processBuild = [];
    }
  }

  @override
  void initState() {
    getRunningProcess();
    super.initState();
  }

  void filterFunction(String option) async {
    if (option == "All") {
      // retrieve all
      tempProcessBuild = await client.extract.retrieveAllProcess();
    } else if (option == "Completed") {
      // retrieve completed
      tempProcessBuild = await client.extract.retrieveByStatus("Completed");
    } else if (option == "Running") {
      // retrieve running
      tempProcessBuild = await client.extract.retrieveByStatus("Running");
    } else if (option == "Inactive") {
      // retrieve idle
      tempProcessBuild = await client.extract.retrieveByStatus("Inactive");
    } else {
      // Retrieve Error
      tempProcessBuild = await client.extract.retrieveByStatus("Error");
    }
    setState(() {
      processBuild = tempProcessBuild;
      tempProcessBuild = [];
    });
  }

  TextEditingController nicheController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final List<String> filterOptions = [
    "All",
    "Completed",
    "Running",
    "Inactive",
    "Error"
  ];
  String? selectedValue = "Running";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Row(
                      children: [
                        // Textfield
                        Expanded(
                            flex: 4,
                            child: AbsTextfield(
                                hintText: "Niche",
                                controller: nicheController)),
                        const SizedBox(width: 5),
                        // Search Button
                        IconButton(
                            onPressed: () async {
                              if (nicheController.text.isNotEmpty) {
                                tempProcessBuild = await client.extract
                                    .retrieveSearchQuery(nicheController.text,
                                        locationController.text);
                                setState(() {
                                  processBuild = tempProcessBuild;
                                  tempProcessBuild = [];
                                });
                              }
                            },
                            icon: Icon(Icons.search)),
                      ],
                    )),
                const SizedBox(width: 10),
                Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    child: Row(
                      children: [
                        // Textfield
                        Expanded(
                            flex: 4,
                            child: AbsTextfield(
                                hintText: "Location",
                                controller: locationController)),
                        const SizedBox(width: 5),
                        // Search Button
                        IconButton(
                            onPressed: () async {
                              if (locationController.text.isNotEmpty) {
                                tempProcessBuild = await client.extract
                                    .retrieveSearchQuery(nicheController.text,
                                        locationController.text);
                                setState(() {
                                  processBuild = tempProcessBuild;
                                  tempProcessBuild = [];
                                });
                              }
                            },
                            icon: Icon(Icons.search)),
                      ],
                    )),
                const Spacer(),
                Container(
                    constraints: BoxConstraints(maxWidth: 150),
                    child: DropdownButton<String>(
                        value: selectedValue,
                        items: filterOptions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                          if (newValue != null) {
                            filterFunction(newValue);
                          }
                        }))
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.center,
              child: Text(
                "Extract Data",
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 2, child: AbsBox(color: Colors.grey, text: "Niche")),
              SizedBox(width: 15),
              Expanded(
                  flex: 2, child: AbsBox(color: Colors.grey, text: "Location")),
              SizedBox(width: 15),
              Expanded(
                  flex: 2, child: AbsBox(color: Colors.grey, text: "Status")),
              const SizedBox(width: 15),
              Expanded(
                  flex: 1, child: AbsBox(color: Colors.grey, text: "Download"))
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              // Search Field
              // Drop Down Menu for easy common navigation
            ],
          ),
          // Listview Builder to building extracted results
          if (processBuild.isEmpty) ...[
            Center(child: Text("No Available Processes"))
          ] else ...[
            for (int i = 0; i < processBuild.length; i++) ...[
              AbsExtract(processData: processBuild[i]),
              const SizedBox(height: 15),
            ]
          ]
        ],
      ),
    );
  }
}

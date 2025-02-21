import 'package:flutter/material.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_scraper.dart';
import 'package:scraper_flutter/components/abs_text.dart';
import 'package:scraper_flutter/components/abs_textfield.dart';
import 'package:scraper_flutter/main.dart';

class Scrapers extends StatefulWidget {
  const Scrapers({super.key});

  @override
  State<Scrapers> createState() => _ScrapersState();
}

class _ScrapersState extends State<Scrapers> {
  List<DBScrapers> scraperBuild = [];
  List<DBScrapers> tempBuild = [];

  TextEditingController searchController = TextEditingController();
  final List<String> filterOptions = [
    "All",
    "Completed",
    "Active",
    "Idle",
    "Error"
  ];
  String? selectedValue = "Active";

  void getScraper() async {
    try {
      final List<DBScrapers> scraper =
          await client.scrape.retrieveByStatus(selectedValue);
      setState(() {
        scraperBuild = scraper;
      });
    } catch (err) {
      scraperBuild = [];
    }
  }

  @override
  void initState() {
    getScraper();
    super.initState();
  }

  void filterFunction(String option) async {
    if (option == "All") {
      // retrieve all
      tempBuild = await client.scrape.retrieveAll();
    } else if (option == "Completed") {
      // retrieve completed
      tempBuild = await client.scrape.retrieveByStatus("Completed");
    } else if (option == "Active") {
      // retrieve running
      tempBuild = await client.scrape.retrieveByStatus("Active");
    } else if (option == "Idle") {
      // retrieve idle
      tempBuild = await client.scrape.retrieveByStatus("Idle");
    } else {
      // Retrieve Error
      tempBuild = await client.scrape.retrieveByStatus("Error");
    }
    setState(() {
      scraperBuild = tempBuild;
      tempBuild = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                hintText: "Scraper ID",
                                controller: searchController)),
                        const SizedBox(width: 8),
                        // Search Button
                        IconButton(
                            onPressed: () async {
                              if (searchController.text.isEmpty) {
                                setState(() {
                                  filterFunction(selectedValue!);
                                });
                              } else {
                                tempBuild = await client.scrape.searchRetrieval(
                                    int.tryParse(searchController.text) ?? 0);
                                setState(() {
                                  scraperBuild = tempBuild;
                                });
                              }
                            },
                            icon: Icon(Icons.search)),
                      ],
                    )),
                const Spacer(),
                // Refresh Button
                IconButton(
                    onPressed: () async {
                      List<int> ids = [];
                      for (int i = 0; i < scraperBuild.length; i++) {
                        ids.add(scraperBuild[i].id ?? 0);
                      }
                      tempBuild = await client.scrape.retrieveSelected(ids);
                      ids = [];
                      setState(() {
                        scraperBuild = tempBuild;
                        tempBuild = [];
                      });
                    },
                    icon: Icon(Icons.refresh)),
                const SizedBox(width: 10),
                Container(
                    constraints: BoxConstraints(maxWidth: 250),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 200,
                color: Colors.grey.shade400,
                alignment: Alignment.center,
                child: Text("ID"),
              ),
              Container(
                height: 40,
                width: 200,
                color: Colors.grey.shade400,
                alignment: Alignment.center,
                child: Text("Working Niche"),
              ),
              Container(
                height: 40,
                width: 200,
                color: Colors.grey.shade400,
                alignment: Alignment.center,
                child: Text("Status"),
              ),
              Container(
                height: 40,
                width: 200,
                color: Colors.grey.shade400,
                alignment: Alignment.center,
                child: Text("Logs"),
              ),
              Container(
                height: 40,
                width: 350,
                color: Colors.grey.shade400,
                alignment: Alignment.center,
                child: Text("Controls"),
              ),
            ],
          ),
          // Build Scraper Information
          const SizedBox(height: 25),
          if (scraperBuild.isEmpty) ...[
            Center(
                child:
                    AbsText(displayText: "No Available Scrapers", fontSize: 25))
          ] else ...[
            for (int i = 0; i < scraperBuild.length; i++) ...[
              AbsScraper(scraper: scraperBuild[i]),
              const SizedBox(height: 15),
            ],
          ],
        ],
      ),
    );
  }
}

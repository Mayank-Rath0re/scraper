import 'package:flutter/material.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_box.dart';
import 'package:scraper_flutter/components/abs_button.dart';
import 'package:scraper_flutter/components/abs_dialog.dart';
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
  List<DBScrapers> queueBuild = [];
  int currentPage = 0;
  int activeFilter = 2;
  bool hasMore = true;

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
      final List<DBScrapers> scraper = await client.scrape
          .retrieveByStatus(selectedValue, limit: 30, offset: currentPage * 30);
      setState(() {
        scraperBuild = scraper;
      });
    } catch (err) {
      scraperBuild = [];
    }
  }

  void getQueue() async {
    try {
      final List<DBScrapers> queued = await client.scrape.retrieveQueue();
      setState(() {
        queueBuild = queued;
      });
    } catch (err) {
      queueBuild = [];
    }
  }

  void loadMore() async {
    if (activeFilter == 0) {
      tempBuild = await client.scrape
          .retrieveAll(limit: 30, offset: (currentPage + 1) * 30);
    } else {
      tempBuild = await client.scrape.retrieveByStatus(
          filterOptions[activeFilter],
          limit: 30,
          offset: (currentPage + 1) * 30);
    }
    setState(() {
      scraperBuild.addAll(tempBuild);
      currentPage++;
      hasMore = tempBuild.length == 30;
      tempBuild = [];
    });
  }

  Future<void> refresh() async {
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
  }

  @override
  void initState() {
    getScraper();
    getQueue();
    super.initState();
  }

  void filterFunction(String option) async {
    int filterMode;
    if (option == "All") {
      // retrieve all
      tempBuild = await client.scrape.retrieveAll(limit: 30, offset: 0);
      filterMode = 0;
    } else if (option == "Completed") {
      // retrieve completed
      tempBuild = await client.scrape
          .retrieveByStatus("Completed", limit: 30, offset: 0);
      filterMode = 1;
    } else if (option == "Active") {
      // retrieve running
      tempBuild =
          await client.scrape.retrieveByStatus("Active", limit: 30, offset: 0);
      filterMode = 2;
    } else if (option == "Idle") {
      // retrieve idle
      tempBuild =
          await client.scrape.retrieveByStatus("Idle", limit: 30, offset: 0);
      filterMode = 3;
    } else {
      // Retrieve Error
      tempBuild =
          await client.scrape.retrieveByStatus("Error", limit: 30, offset: 0);
      filterMode = 4;
    }
    setState(() {
      scraperBuild = tempBuild;
      print(scraperBuild.length);
      activeFilter = filterMode;
      currentPage = 0;
      hasMore = tempBuild.length == 30;
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
                const SizedBox(width: 20),
                AbsButton(
                    text: "Queued Scrapers",
                    icon: Icon(Icons.query_builder),
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Close"))
                                ],
                                content: SizedBox(
                                  width: 600,
                                  height: 700,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        if (queueBuild.isEmpty) ...[
                                          Center(
                                              child:
                                                  Text("No Scrapers Queued !"))
                                        ] else ...[
                                          for (int i = 0;
                                              i < queueBuild.length;
                                              i++) ...[
                                            Row(
                                              children: [
                                                AbsBox(
                                                    color: Colors.cyan.shade50,
                                                    text:
                                                        "${queueBuild[i].id}"),
                                                const SizedBox(width: 5),
                                                AbsBox(
                                                    color: Colors.cyan.shade50,
                                                    text: queueBuild[i]
                                                                .niche
                                                                .length ==
                                                            1
                                                        ? queueBuild[i].niche[0]
                                                        : "Diversified"),
                                                const SizedBox(width: 5),
                                                AbsBox(
                                                    color: Colors.cyan.shade50,
                                                    text:
                                                        "${queueBuild[i].processCount}"),
                                                const SizedBox(width: 5),
                                                TextButton(
                                                    onPressed: () {
                                                      client.scrape
                                                          .startScraping(
                                                              queueBuild[i]);
                                                      showDialog(
                                                          // ignore: use_build_context_synchronously
                                                          context: context,
                                                          builder: (context) {
                                                            return AbsDialog(
                                                                message:
                                                                    "Scraper Started",
                                                                color: Colors
                                                                    .green);
                                                          });
                                                      queueBuild.removeAt(i);
                                                    },
                                                    child: Text(
                                                      "Start Now",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .green.shade900),
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(height: 15)
                                          ]
                                        ]
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                    }),
                const SizedBox(width: 20),
                AbsText(displayText: "${queueBuild.length}", fontSize: 20),
                const Spacer(),
                // Refresh Button
                IconButton(
                    onPressed: () {
                      refresh();
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
            for (int i = currentPage * 30; i < scraperBuild.length; i++) ...[
              AbsScraper(scraper: scraperBuild[i]),
              const SizedBox(height: 15),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                AbsButton(
                    text: "Previous Page",
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      if (currentPage > 0) {
                        currentPage--;
                        refresh();
                      }
                    }),
                const Spacer(),
                AbsButton(
                    text: "Next Page",
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if ((currentPage + 1) * 30 <= scraperBuild.length) {
                        loadMore();
                        if ((currentPage + 1) * 30 < scraperBuild.length) {
                          // Do nothing
                        } else {
                          refresh();
                        }
                      } else {
                        //
                      }
                    })
              ],
            )
          ],
        ],
      ),
    );
  }
}

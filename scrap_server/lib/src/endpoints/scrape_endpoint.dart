import 'dart:io';

import 'package:csv/csv.dart';
import 'package:scrap_server/src/generated/protocol.dart';
import 'package:scrap_server/src/models/model_dashboard.dart';
import 'package:scrap_server/src/models/model_queue.dart';
import 'package:serverpod/serverpod.dart';

class ScrapeEndpoint extends Endpoint {
  // New instance of dashboard info
  Dashboard metricData = Dashboard();
  ModelQueue queueObj = ModelQueue();
  // Function 1:
  // Function to receive input and create query file
  Future<void> startNewScrape(
      Session session, List<String> niche, List<String> locations,
      {String mode = "start"}) async {
    List<String> filenames = [];
    List<int> processes = [];
    int newQueryCount = 0;

    // Create query for each pair of niche & location
    for (int i = 0; i < niche.length; i++) {
      for (int j = 0; j < locations.length; j++) {
        // Creating file for each query
        String name = "${niche[i]}in${locations[j]}";
        filenames.add(name);
        final File file = File("queries/$name.txt");
        var writer = file.openWrite();
        writer.write("${niche[i]} in ${locations[j]}");
        writer.close();
        // Create process and append to process list
        var process = await DBProcess.db.find(session,
            where: (t) =>
                (t.niche.equals(niche[i]) & t.location.equals(locations[j])));
        if (process.isEmpty) {
          DBProcess processRow =
              DBProcess(niche: niche[i], location: locations[j]);
          var processNew = await DBProcess.db.insert(session, [processRow]);
          newQueryCount += 1;
          // A temporary fix, should work fine for all scenarios :)
          processes.add(processNew[0].id ?? -1);
        } else {
          // A temporary fix, should work fine for all scenarios :)
          processes.add(process[0].id ?? -1);
        }
      }
    }

    // Creating a scraper object
    var row = DBScrapers(
        niche: niche,
        location: locations,
        status: "Idle",
        createdAt: DateTime.now(),
        logs: "",
        processes: processes,
        processCount: (niche.length * locations.length));

    // Inserting the scraper object into the database
    // ignore: unused_local_variable
    var scraper = await DBScrapers.db.insert(session, [row]);

    // Increment Total Scrapers
    print("Updating metric data");
    metricData.incrementTotalScraper(1);
    // Increment Total Leads
    metricData.incrementTotalLeads(newQueryCount);
    print(
        "New Metric Total Data: ${metricData.totalScrapers} scrapers and ${metricData.totalLeads} leads");

    if (mode == "start") {
      startScraping(session, scraper[0]);
    } else {
      queueScraper(session, scraper[0]);
    }
  }

  Future<void> queueScraper(Session session, DBScrapers scraper) async {
    // Update Queue
    queueObj.queue.add(scraper.id!);
  }

  Future<List<int>> dashboardData(Session session) async {
    List<int> result = [];
    result.addAll(metricData.scrapeInfo());
    result.addAll(metricData.extractionInfo());
    return result;
  }

  Future<List<DBScrapers>> searchRetrieval(
      Session session, int searchId) async {
    List<DBScrapers> searchResult =
        await DBScrapers.db.find(session, where: (t) => t.id.equals(searchId));
    return searchResult;
  }

  // Retrieve all scrapers
  Future<List<DBScrapers>> retrieveAll(Session session) async {
    List<DBScrapers> scraperBuild = await DBScrapers.db.find(session);
    return scraperBuild;
  }

  // To get information of completed processes from a certain scraper
  Future<int> statusCount(Session session, int scraperId) async {
    int count = 0;
    // Find the scraper
    var scraper = await DBScrapers.db.findById(session, scraperId);
    for (int i = 0; i < scraper!.processes.length; i++) {
      DBProcess? process =
          await DBProcess.db.findById(session, scraper.processes[i]);
      if (process!.status == "Completed") {
        count += 1;
      }
    }
    return count;
  }

  Future<void> interruptScraping(Session session, DBScrapers scraper) async {
    scraper.status = "Error";
    metricData.decrementRunningScraper();
    // ignore: unused_local_variable
    var updateScraper = await DBScrapers.db.updateRow(session, scraper);
  }

  // Function 2:
  // Function to initiate scrape command using the generate csv file
  // Perform UI updations for efficient query management
  Future<void> startScraping(Session session, DBScrapers scraper) async {
    List<int> processes = scraper.processes;
    int exitCode = 0;
    // Increment running scraper by 1
    metricData.incrementRunningScraper();
    // If scraper is not on running status, happens when continuing from UI
    if (scraper.status != "Active") {
      scraper.status = "Active";
      // ignore: unused_local_variable
      var updateScraper = await DBScrapers.db.updateRow(session, scraper);
    }

    // Remove Scraper from queue if it is there
    // Happens on manual starting scraper
    if (queueObj.queue.contains(scraper.id)) {
      queueObj.queue.remove(scraper.id);
    }

    // Scrape each process
    for (int i = 0; i < processes.length; i++) {
      var process = await DBProcess.db.findById(session, processes[i]);
      if (process!.status == "Completed") {
        continue;
      }
      print("Scraping started for ${process.niche} in ${process.location}");
      // Sample process for now, need to be changed later
      Process startProcess = await Process.start("google-maps-scraper.exe", [
        "-input",
        "queries/${process.niche}in${process.location}.txt",
        "-results",
        "results/${process.niche}in${process.location}.csv",
        "-email",
        "-exit-on-inactivity",
        "3m"
      ]);

      // Updating Factors in process
      process.status = "Running";
      process.processId = startProcess.pid;

      // ignore: unused_local_variable
      var runningProcess = await DBProcess.db.updateRow(session, process);

      // Listen for errors
      startProcess.stderr.listen((onData) {
        //Update Accordingly, empty for now
        // print here only when debugging
      });

      // wait for the process to finish
      exitCode = await startProcess.exitCode;
      print(exitCode);
      String newStatus = exitCode == 0 ? "Completed" : "Error";
      runningProcess.status = newStatus;
      // ignore: unused_local_variable
      var updatedProcess =
          await DBProcess.db.updateRow(session, runningProcess);
      if (exitCode != 0) {
        print("Error occured");
        await interruptScraping(session, scraper);
        break;
      }
    }
    print("exitCode after exiting loop: $exitCode");
    // After scraping, update factors
    // Needs to be coded
    if (exitCode == 0) {
      // All scrapers completed successfully
      scraper.status = "Completed";
      // Decrement Running Scrapers
      metricData.decrementRunningScraper();
      // ignore: unused_local_variable
      var updateScraper = await DBScrapers.db.updateRow(session, scraper);

      // Start E-mail Verification

      // Create and insert email process object
      var emailVerObject = DBEmail(
          scraperId: scraper.id!,
          status: "Inactive",
          processIds: scraper.processes,
          completed: 0);

      // ignore: unused_local_variable
      var emailEntry = await DBEmail.db.insert(session, [emailVerObject]);

      print("Starting Email Verification for scraper: ${scraper.id}");
      startVerification(session, emailEntry[0]);

      if (queueObj.queue.isNotEmpty) {
        int nextScrapeId = queueObj.popQueue();
        var nextScraper = await DBScrapers.db.findById(session, nextScrapeId);
        startScraping(session, nextScraper!);
        print("Updated Queue, Started Scraping for next scraper");
      } else {
        return;
      }
    }
  }

  Future<Extracted> createExtractObject(List<dynamic> objectData) async {
    List<dynamic> row = [];
    for (int i = 0; i < objectData.length; i++) {
      if (objectData[i] == null) {
        row.add("");
      } else {
        row.add(objectData[i]);
      }
    }
    var extractedData = Extracted(
        inputId: row[0],
        link: row[1],
        title: row[2],
        category: row[3],
        address: row[4],
        openHours: row[5],
        popularTimes: row[6],
        website: row[7],
        phone: row[8],
        plusCode: row[9],
        reviewCount: row[10],
        reviewPerRating: row[11],
        latitude: row[12],
        longitude: row[13],
        cid: row[14],
        status: row[15],
        description: row[16],
        reviewsLink: row[17],
        thumbnail: row[18],
        timezone: row[19],
        priceRange: row[20],
        dataId: row[21],
        images: row[22],
        reservations: row[23],
        orderOnline: row[24],
        menu: row[25],
        owner: row[26],
        completeAddress: row[27],
        about: row[28],
        userReviews: row[29],
        emails: row[30]);
    return extractedData;
  }

  Future<void> startVerification(Session session, DBEmail emailObject) async {
    // Set email Object Status to Running
    if (emailObject.status == "Completed") {
      return;
    }
    if (emailObject.status != "Running") {
      emailObject.status = "Running";
      // ignore: unused_local_variable
      var insertEntry = await DBEmail.db.update(session, [emailObject]);
    }
    try {
      // Start Extracting
      List<int> processes = emailObject.processIds;
      // Extract each process details
      for (int i = 0; i < processes.length; i++) {
        // Get the process details
        DBProcess? process = await DBProcess.db.findById(session, processes[i]);
        List<Extracted> data = [];
        String filename = "${process!.niche}in${process.location}.csv";
        File file = File("results/$filename");
        String? csvContent = await file.readAsString();
        // 31 columns - Just a personal note
        List<List<dynamic>> csvRows = CsvToListConverter().convert(csvContent);
        for (var row in csvRows) {
          String email = row[30];
          if (email.isEmpty) {
            continue;
          }
          // Create new extracted entry
          var extractEntry = await createExtractObject(row);
          data.add(extractEntry);
        }
        // Insert Extracted Entry
        // ignore: unused_local_variable
        var insertExtract = Extracted.db.insert(session, data);
        // Create LeadInfo Object
        var leadObject = DBLeadInfo(
            niche: process.niche,
            location: process.location,
            isExtracted: true,
            data: data);
        // Insert LeadInfo
        // ignore: unused_local_variable
        var insertLeadInfo = DBLeadInfo.db.insert(session, [leadObject]);

        // update completed
        emailObject.completed += 1;
        // ignore: unused_local_variable
        var updateEmail = DBEmail.db.update(session, [emailObject]);
        // Increment extracted leads
        metricData.incrementExtractedLeads();
      }
    } catch (_) {
      emailObject.status = "Error";
      // ignore: unused_local_variable
      var insertError = await DBEmail.db.update(session, [emailObject]);
      return;
    }
    print("Verification for ${emailObject.scraperId} scraper completed");
    // on complete email extraction
    emailObject.status = "Completed";
    // ignore: unused_local_variable
    var insertComplete = await DBEmail.db.update(session, [emailObject]);
  }

  // Different Retrieval Schemes
  Future<List<DBScrapers>> retrieveByStatus(
      Session session, String? status) async {
    List<DBScrapers> statusScrapers = await DBScrapers.db
        .find(session, where: (t) => t.status.equals(status));
    return statusScrapers;
  }

  // Control Functions

  // Pause Scraping
  Future<int> pauseProcess(Session session, DBScrapers scraper) async {
    List<int> processes = scraper.processes;
    // Find the running process of the scraper
    int id = scraper.id ?? 0;
    if (id == 0) {
      print("Here");
      return -1;
    }
    int runningIndex = await statusCount(session, id);
    DBProcess? runningProcess =
        await DBProcess.db.findById(session, processes[runningIndex]);
    // Stop the process
    bool pausing =
        Process.killPid(runningProcess!.processId, ProcessSignal.sigstop);
    print("Here are pausing process, status: $pausing");
    if (pausing == true) {
      // Decrement Running Scraper
      metricData.incrementRunningScraper();
      // Update Factors
      runningProcess.status = "Inactive";
      runningProcess.processId = 0;
      // ignore: unused_local_variable
      var updatedProcess =
          await DBProcess.db.updateRow(session, runningProcess);
      scraper.status = "Idle";
      // ignore: unused_local_variable
      var updatedScraper = await DBScrapers.db.updateRow(session, scraper);
      print("Process Paused Successfully");
      return 1;
    } else {
      return 0;
    }
  }

  Future<List<DBScrapers>> retrieveSelected(
      Session session, List<int> scraperIds) async {
    Set<int> ids = {...scraperIds};
    List<DBScrapers> scrapers =
        await DBScrapers.db.find(session, where: (t) => t.id.inSet(ids));
    return scrapers;
  }

  // Stop Scraping
  Future<int> stopProcess(Session session, DBScrapers scraper) async {
    List<int> processes = scraper.processes;
    // Find the running process of the scraper
    int id = scraper.id ?? 0;
    if (id == 0) {
      return -1;
    }
    int runningIndex = await statusCount(session, id);
    DBProcess? runningProcess =
        await DBProcess.db.findById(session, processes[runningIndex]);
    // Stop the process
    bool terminating =
        Process.killPid(runningProcess!.processId, ProcessSignal.sigkill);
    print("Here are killing process, status: $terminating");
    if (terminating == true) {
      // Decrement Running Scrapers
      metricData.decrementRunningScraper();
      // Update Factors
      runningProcess.status = "Inactive";
      runningProcess.processId = 0;
      // ignore: unused_local_variable
      var updatedProcess =
          await DBProcess.db.updateRow(session, runningProcess);
      scraper.status = "Idle";
      // ignore: unused_local_variable
      var updatedScraper = await DBScrapers.db.updateRow(session, scraper);
      print("Process Stopped Successfully");
      return 1;
    } else {
      return 0;
    }
  }
}

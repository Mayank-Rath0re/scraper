import 'dart:io';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:scraper_server/src/generated/protocol.dart';
import 'package:scraper_server/src/models/model_dashboard.dart';
import 'package:scraper_server/src/models/model_queue.dart';
import 'package:serverpod/serverpod.dart';

class ScrapeEndpoint extends Endpoint {
  // New instance of dashboard info
  Dashboard metricData = Dashboard();
  ModelQueue queueObj = ModelQueue();

  Future<int> retrieveQueueCount(Session session) async {
    return queueObj.queue.length;
  }

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
  Future<List<DBScrapers>> retrieveAll(Session session,
      {int limit = 30, int offset = 0}) async {
    List<DBScrapers> scraperBuild = await DBScrapers.db.find(session,
        limit: limit,
        offset: offset,
        orderBy: (t) => t.createdAt,
        orderDescending: true);
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

  Future<void> prepareContainerFiles(String niche, String location) async {
    // Create Query File
    // ignore: unused_local_variable
    var createQuery = await Process.run("docker", [
      "exec",
      "maps-scraper",
      "bash",
      "-c",
      "touch '${niche}in$location.txt' && echo '$niche in $location' >> '${niche}in$location.txt'"
    ]);

    print("Created Query File");
    // Create Results File
    // ignore: unused_local_variable
    var createResult = await Process.run(
        "docker",
        [
          "exec",
          "maps-scraper",
          "bash",
          "-c",
          "touch '${niche}in$location.csv'"
        ],
        runInShell: true);

    print("Created Result File");

    if (createQuery.exitCode == 0) {
      print("Successfully created Query file.");
    } else {
      print("Error creating Query file: ${createQuery.stderr}");
    }
  }

  Future<void> fetchExtractedData(
      Session session, String niche, String location) async {
    // ignore: unused_local_variable
    var dataContent = await Process.run("docker", [
      "cp",
      "maps-scraper:/${niche}in$location.csv",
      "/results/${niche}in$location.csv",
    ]);
    // ignore: unused_local_variable
    var delCsv = await Process.run("docker", [
      "exec",
      "maps-scraper",
      "rm",
      "/${niche}in$location.csv",
      "/${niche}in$location.txt"
    ]);

    if (dataContent.exitCode == 0) {
      print("Successfully created Query file.");
    } else {
      print("Error creating Query file: ${dataContent.stderr}");
    }
  }

  Future<void> startScraping(Session session, DBScrapers scraper) async {
    List<int> processes = scraper.processes;
    int exitCode = 0;
    var errorString = "";
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
      errorString = "";
      if (process!.status == "Completed") {
        continue;
      }
      print("Scraping started for ${process.niche} in ${process.location}");
      // Sample process for now, need to be changed later
      // ignore: unused_local_variable
      await prepareContainerFiles(process.niche, process.location);

      // ignore: unused_local_variable
      Process startProcess = await Process.start("docker", [
        "exec",
        "maps-scraper",
        "bash",
        "-c",
        "google-maps-scraper -input '${process.niche}in${process.location}.txt' -results '${process.niche}in${process.location}.csv' -email -exit-on-inactivity 3m",
      ]);

      // Updating Factors in process
      process.status = "Running";
      process.processId = startProcess.pid;

      // ignore: unused_local_variable
      var runningProcess = await DBProcess.db.updateRow(session, process);

      // Listen for errors
      startProcess.stderr.transform(SystemEncoding().decoder).listen((onData) {
        //Update Accordingly, empty for now
        // print here only when debugging
        // print(onData);
        errorString += onData;
      });

      // wait for the process to finish
      exitCode = await startProcess.exitCode;
      print(exitCode);
      String newStatus = exitCode == 0 ? "Completed" : "Error";
      runningProcess.status = newStatus;
      if (exitCode != 0) {
        if (!errorString.contains("context canceled")) {
          print("Error occured");
          print("Error Note: $errorString");
          await interruptScraping(session, scraper);
          break;
        } else {
          runningProcess.status = "Completed";
        }
      }
      // ignore: unused_local_variable
      var updatedProcess =
          await DBProcess.db.updateRow(session, runningProcess);
    }
    print("exitCode after exiting loop: $exitCode");
    if (errorString == "") {
      // Gateway for duplicate process scrapers to go to complete status
    } else if (exitCode == -9 || !errorString.contains("context canceled")) {
      return;
    }
    // After scraping, update factors
    // Needs to be coded
    // All scrapers completed successfully
    scraper.status = "Completed";
    // Decrement Running Scrapers
    print("Scraper Completed. Decrementing Running Scrapers");
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
        reviewRating: row[11],
        reviewPerRating: row[12],
        latitude: row[13],
        longitude: row[14],
        cid: row[15],
        status: row[16],
        description: row[17],
        reviewsLink: row[18],
        thumbnail: row[19],
        timezone: row[20],
        priceRange: row[21],
        dataId: row[22],
        images: row[23],
        reservations: row[24],
        orderOnline: row[25],
        menu: row[26],
        owner: row[27],
        completeAddress: row[28],
        about: row[29],
        userReviews: row[30],
        emails: row[31]);
    return extractedData;
  }

  // Retrieve from Database and create CSV file
  Future<void> prepareCsv(
      Session session, String niche, String location) async {
    //  Search for the DBLeadInfo Object
    var infoObj = await DBLeadInfo.db.find(session,
        where: (t) => (t.niche.equals(niche) & t.location.equals(location)));
    if (infoObj.isEmpty) {
      return;
    }
    List<List<String>> writeData = [];
    List<Extracted> data = infoObj[0].data;
    for (int i = 0; i < data.length; i++) {
      List<String> entryRow = [];
      entryRow.add(data[i].inputId);
      entryRow.add(data[i].link);
      entryRow.add(data[i].title);
      entryRow.add(data[i].category);
      entryRow.add(data[i].address);
      entryRow.add(data[i].openHours);
      entryRow.add(data[i].popularTimes);
      entryRow.add(data[i].website);
      entryRow.add(data[i].phone);
      entryRow.add(data[i].plusCode);
      entryRow.add(data[i].reviewCount);
      entryRow.add(data[i].reviewRating);
      entryRow.add(data[i].reviewPerRating);
      entryRow.add(data[i].latitude);
      entryRow.add(data[i].longitude);
      entryRow.add(data[i].cid);
      entryRow.add(data[i].status);
      entryRow.add(data[i].description);
      entryRow.add(data[i].reviewsLink);
      entryRow.add(data[i].thumbnail);
      entryRow.add(data[i].timezone);
      entryRow.add(data[i].priceRange);
      entryRow.add(data[i].dataId);
      entryRow.add(data[i].images);
      entryRow.add(data[i].reservations);
      entryRow.add(data[i].orderOnline);
      entryRow.add(data[i].menu);
      entryRow.add(data[i].owner);
      entryRow.add(data[i].completeAddress);
      entryRow.add(data[i].about);
      entryRow.add(data[i].userReviews);
      entryRow.add(data[i].emails);

      writeData.add(entryRow);
    }
    File file = File("results/${niche}in$location.csv");
    String convData = ListToCsvConverter().convert(writeData);
    var writer = file.openWrite();
    writer.write(convData);
  }

  // Retrieve CSV File
  Future<ByteData?> retrieveSingleData(Session session, int? processId) async {
    var process = await DBProcess.db.findById(session, processId!);
    try {
      Uint8List fileBytes =
          await File("results/${process!.niche}in${process.location}.csv")
              .readAsBytes();
      ByteData? fileData = ByteData.view(fileBytes.buffer);
      return fileData;
    } catch (err) {
      session.log("File not found");
      return null;
    }
  }

  // Retrieve RAR File (For Scrapers)
  Future<ByteData?> retrieveRar(Session session, int? scraperId) async {
    try {
      // Archive the data
      var scraper = await DBScrapers.db.findById(session, scraperId!);
      List<String> fileNames = [];
      // Get the name of all files & retrieve their data from database to csv
      for (int i = 0; i < scraper!.niche.length; i++) {
        for (int j = 0; j < scraper.location.length; j++) {
          // Append the file name
          fileNames
              .add("results/${scraper.niche[i]}in${scraper.location[j]}.csv");
        }
      }
      List<String> commandArguments = [];
      commandArguments.add("results/$scraperId.zip");
      commandArguments.addAll(fileNames);
      await Process.run("zip", commandArguments);
      // Return the data
      Uint8List fileBytes = await File("results/$scraperId.zip").readAsBytes();
      ByteData? fileData = ByteData.view(fileBytes.buffer);
      return fileData;
    } catch (e) {
      session.log("Error Downloading files");
      return null;
    }
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
        // ignore: unused_local_variable
        var preproc =
            await fetchExtractedData(session, process!.niche, process.location);
        String filename = "${process.niche}in${process.location}.csv";
        Process vericProc = await Process.start(
            "echo", [filename, "|", "python3", "verify.py"]);

        if (await vericProc.exitCode == 0) {
          print("Successfully created Query file.");
        } else {
          print("Error creating Query file: ${vericProc.stderr}");
        }

        // update completed
        emailObject.completed += 1;
        // ignore: unused_local_variable
        var updateEmail = DBEmail.db.update(session, [emailObject]);
        // Increment extracted leads
        metricData.incrementExtractedLeads();
      }
      print("Verification for ${emailObject.scraperId} scraper completed");
      // on complete email extraction
      emailObject.status = "Completed";
      // ignore: unused_local_variable
      var insertComplete = await DBEmail.db.update(session, [emailObject]);
    } catch (_) {
      emailObject.status = "Error";
      // ignore: unused_local_variable
      print("Error occured while verification");
      print(_);
      // ignore: unused_local_variable
      var insertError = await DBEmail.db.update(session, [emailObject]);
      return;
    }
  }

  Future<void> deleteScraper(Session session, int scraperId) async {
    // Stop the scraper if running
    var scraper = await DBScrapers.db.findById(session, scraperId);
    print("Deleting Scraper: ${scraper!.id}");
    if (scraper.status == "Active") {
      // ignore: unused_local_variable
      var stopScraper = await pauseProcess(session, scraper);
    }
    if (scraper.status == "Completed") {
      // Delete the files
      for (int i = 0; i < scraper.niche.length; i++) {
        for (int j = 0; j < scraper.location.length; j++) {
          try {
            fetchExtractedData(session, scraper.niche[i], scraper.location[j]);
            // ignore: unused_local_variable
            var removeFile = await Process.run("rm", [
              "/queries/${scraper.niche[i]}in${scraper.location[j]}.txt",
              "/results/${scraper.niche[i]}in${scraper.location[j]}.csv"
            ]);
          } catch (err) {
            print(err);
            continue;
          }
        }
      }
      print("Removed Files");
    }
    // Delete all child processes
    for (int i = 0; i < scraper.processes.length; i++) {
      var process = await DBProcess.db.findById(session, scraper.processes[i]);
      // ignore: unused_local_variable
      var delProcess = await DBProcess.db.deleteRow(session, process!);
    }

    // Remove the email verification processes
    // ignore: unused_local_variable
    var emailObj = await DBEmail.db
        .deleteWhere(session, where: (t) => t.scraperId.equals(scraperId));
    // Delete the Scraper
    print("Deleted Scraper and Processes Successfully");
    // ignore: unused_local_variable
    var delScraper = await DBScrapers.db.deleteRow(session, scraper);
    metricData.totalScrapers -= 1;
    metricData.totalLeads -= scraper.processCount;
    metricData.extractedLeads -= scraper.processCount;
  }

  // Different Retrieval Schemes
  Future<List<DBScrapers>> retrieveByStatus(Session session, String? status,
      {int limit = 30, int offset = 0}) async {
    List<DBScrapers> statusScrapers = await DBScrapers.db.find(session,
        where: (t) => t.status.equals(status),
        limit: limit,
        offset: offset,
        orderBy: (t) => t.createdAt,
        orderDescending: true);
    return statusScrapers;
  }

  Future<List<DBScrapers>> retrieveQueue(Session session) async {
    List<DBScrapers> queuedScrapers = await DBScrapers.db
        .find(session, where: (t) => t.id.inSet(queueObj.queue.toSet()));
    print("Retrieved Queue: $queuedScrapers");
    return queuedScrapers;
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

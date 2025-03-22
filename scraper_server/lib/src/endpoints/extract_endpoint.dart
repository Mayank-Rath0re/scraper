import 'dart:io';

import 'package:csv/csv.dart';
import 'package:scraper_server/src/generated/db_leadinfo.dart';
import 'package:scraper_server/src/generated/db_process.dart';
import 'package:serverpod/serverpod.dart';

class ExtractEndpoint extends Endpoint {
  // Function to retrieve all processes
  // Try to not use if possible
  Future<List<DBProcess>> retrieveAllProcess(Session session,
      {int limit = 30, int offset = 0}) async {
    List<DBProcess> processes =
        await DBProcess.db.find(session, limit: limit, offset: offset);
    return processes;
  }

  // Search by niche & location
  Future<List<DBProcess>> retrieveSearchQuery(
      Session session, String nichePattern, String locationPattern) async {
    List<DBProcess> resultProcesses = await DBProcess.db.find(session,
        where: (t) => (t.niche.like("$nichePattern%") &
            t.location.like("$locationPattern%")));
    return resultProcesses;
  }

  // Search by Completion Status
  Future<List<DBProcess>> retrieveByStatus(Session session, String status,
      {int limit = 30, int offset = 0}) async {
    List<DBProcess> statusProcess = await DBProcess.db.find(session,
        where: (t) => (t.status.equals(status)), limit: limit, offset: offset);
    return statusProcess;
  }

  Future<List<DBProcess>> retrieveSelected(
      Session session, List<int> processIds) async {
    Set<int> ids = {...processIds};
    List<DBProcess> processes =
        await DBProcess.db.find(session, where: (t) => t.id.inSet(ids));
    return processes;
  }

  Future<void> prepareExtractData(Session session, DBProcess process) async {
    // Find the LeadInfo Object
    List<DBLeadInfo> scrapedObject = await DBLeadInfo.db.find(session,
        where: ((t) =>
            t.niche.equals(process.niche) &
            t.location.equals(process.location)));

    // Convert Extracted to List<List<dynamic>>
    List<List<dynamic>> parsedData = [];
    for (int i = 0; i < scrapedObject[0].data.length; i++) {
      List<dynamic> rowData = scrapedObject[0].data.toList();
      parsedData.add(rowData);
    }

    // Create CSV file and store the data
    String csvData = ListToCsvConverter().convert(parsedData);
    File file = File("results/${process.niche}in${process.location}.csv");
    file.writeAsString(csvData);

    // Send for download
  }
}

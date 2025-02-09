class Dashboard {
  late int totalScrapers;
  late int runningScrapers;
  late int totalLeads;
  late int extractedLeads;

  Dashboard() {
    totalScrapers = 0;
    runningScrapers = 0;
    totalLeads = 0;
    extractedLeads = 0;
  }

  List<int> scrapeInfo() {
    return [runningScrapers, totalScrapers];
  }

  List<int> extractionInfo() {
    return [extractedLeads, totalLeads];
  }

  void incrementTotalScraper(int amount) {
    totalScrapers += amount;
  }

  void incrementTotalLeads(int amount) {
    totalLeads += amount;
  }

  void incrementRunningScraper({int amount = 1}) {
    runningScrapers += amount;
  }

  void decrementRunningScraper({int amount = 1}) {
    runningScrapers -= amount;
  }

  void incrementExtractedLeads({int amount = 1}) {
    extractedLeads += amount;
  }
}

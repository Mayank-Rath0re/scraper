class CacheQuery {
  late List<String> niche;
  late List<String> locations;

  CacheQuery() {
    niche = [];
    locations = [];
  }

  void addNiche(String tempNiche) {
    niche.add(tempNiche);
  }

  bool containsNiche(String temp) {
    return niche.contains(temp);
  }

  bool containsLocation(String temp) {
    return locations.contains(temp);
  }

  void addLocation(String tempLocation) {
    locations.add(tempLocation);
  }

  void removeNiche(int index) {
    niche.removeAt(index);
  }

  void removeLocation(int index) {
    locations.removeAt(index);
  }

  bool nicheIsEmpty() {
    if (niche.isEmpty) {
      return true;
    }
    return false;
  }

  void flushData() {
    niche = [];
    locations = [];
  }

  bool locationIsEmpty() {
    if (locations.isEmpty) {
      return true;
    }
    return false;
  }
}

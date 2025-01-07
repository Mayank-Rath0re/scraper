class ModelQueue {
  late List<int> queue;

  ModelQueue() {
    queue = [];
  }

  void addToQueue(int id) {
    queue.add(id);
  }

  int popQueue() {
    int nextScraper = queue[0];
    queue.removeAt(0);
    return nextScraper;
  }
}

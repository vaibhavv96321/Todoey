class Tasks {
  String name;
  bool isDone;

  Tasks({this.name = ' ', this.isDone = false});

  void toggleDone() async {
    isDone = !isDone;
  }
}

// TODO: this class represents each task objects
class Task {
  final String name;
  bool isDone;

  Task({required this.name,  this.isDone=false});

  void toggleDone(){
    isDone = !isDone;
  }
}
import 'package:hive/hive.dart';

class TodoDatabase {
  List toDoList = [];
  final _myBox = Hive.box("mybox");

  void createInitData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Go to the Gym", false],
    ];
  }

  void loadDatabase() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDatabase() {
    _myBox.put(("TODOLIST"), toDoList);
  }
}

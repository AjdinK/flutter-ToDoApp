import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/todo_database.dart';
import 'package:flutter_test_app/util/dialog_box.dart';
import 'package:flutter_test_app/util/todo_tile.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("mybox");
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      db.loadDatabase();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _controller.text,
        false,
        _controller.clear(),
      ]);
      db.updateDatabase();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyanAccent,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskValue: db.toDoList[index][1],
            onChange: (value) => checkBoxChanged(value, index),
            deleteCard: (context) => deleteTask(index),
          );
        },
      ),
    );
  }

  checkBoxChanged(bool? p1, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }
}

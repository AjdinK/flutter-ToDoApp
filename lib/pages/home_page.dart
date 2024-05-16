import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/util/dialog_box.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List listToDo = [
    ["Make Tutorials", true],
    ["Go to Walk", false],
    ["Go to Walk", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      listToDo[index][1] = !listToDo[index][1];
    });
  }

  void saveNewTask () {

    setState(() {
      listToDo.add([
        _controller.text , false,
        _controller.clear(),
      ]);
    });
    Navigator.of(context).pop();
  }

  void createNewTask () {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask ,
        onCancel: ()=> Navigator.of(context).pop() ,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        backgroundColor: Colors.blue[200],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[400],
          onPressed: createNewTask,
          child: Icon(Icons.add)
      ),
      backgroundColor: Colors.blue[100],
      body:  ListView.builder(
          itemCount: listToDo.length ,
          itemBuilder: (context , index) {
            return TodoTile(
              taskName: listToDo[index][0] ,
              taskCompleted: listToDo[index][1] ,
              onChange: (value) => checkBoxChanged(value, index),
            );
          }
      ),
    );
  }


}

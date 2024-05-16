import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List listToDo = [
    ["Make Tutorials", true],
    ["Go to Walk", false],
    ["Go to Walk", false],
  ];

  checkBoxChanged(bool? value, int index) {
    setState(() {
      listToDo[index][1] = !listToDo[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        backgroundColor: Colors.blue[200],
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

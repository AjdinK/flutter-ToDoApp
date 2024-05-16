import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {


  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChange;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top:25),
      child: Container(
        padding: EdgeInsets.all(25),
        child:
        Row(
          children: [
            Checkbox(value: taskCompleted,
              onChanged: onChange
              ,activeColor: Colors.blue[600],
              checkColor: Colors.white,),
            Text(taskName,
              style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(9)
        ),
      ),
    );
  }
}

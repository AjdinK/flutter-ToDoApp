import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskValue;
  Function(bool?)? onChange;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
        left: 20,
        right: 20,
      ),
      height: 70,
      child: Card(
        color: Colors.cyanAccent,
        child: Row(
          children: [
            Checkbox(
              value: taskValue,
              onChanged: onChange,
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: taskValue
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}

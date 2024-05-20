import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskValue;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteCard;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskValue,
    required this.onChange,
    required this.deleteCard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              icon: (Icons.delete_forever_outlined),
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(9),
              onPressed: deleteCard,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.cyanAccent,
          ),
          height: 100,
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
      ),
    );
  }
}

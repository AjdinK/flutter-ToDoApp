import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyanAccent,
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "New task",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onSave,
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

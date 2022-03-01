import 'package:flutter/material.dart';
import 'package:flutter_todo/utils.dart';

class DeleteBtn extends StatelessWidget {
  const DeleteBtn({Key? key, required this.setTasks}) : super(key: key);
  final Function setTasks;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        deleteAllTasks();
        setTasks();
      },
      label: const Text("Delete"),
      icon: const Icon(Icons.delete),
      backgroundColor: Colors.red,
    );
  }
}

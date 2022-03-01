import 'package:flutter/material.dart';
import 'package:flutter_todo/components/task.dart';
import 'package:flutter_todo/constant.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key, required this.tasks}) : super(key: key);
  final Future<List<String>?> tasks;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>?>(
      future: tasks,
      builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!
                .map(
                  (title) => Task(title: title),
                )
                .toList(),
          );
        } else if (snapshot.hasData == false) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              "Add some Tasks here!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }
        return const Text("Error occur!");
      },
    );
  }
}

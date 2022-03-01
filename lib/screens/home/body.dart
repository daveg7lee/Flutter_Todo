import 'package:flutter/material.dart';
import 'package:flutter_todo/components/header.dart';
import 'package:flutter_todo/components/my_form.dart';
import 'package:flutter_todo/constant.dart';
import 'package:flutter_todo/components/tasks.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.tasks, required this.setTasks})
      : super(key: key);
  final Future<List<String>?> tasks;
  final Function setTasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultPadding,
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding * 2.5,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            Tasks(
              tasks: tasks,
            ),
            MyForm(setTasks: setTasks),
          ],
        ),
      ),
    );
  }
}

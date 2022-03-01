import 'package:flutter/material.dart';
import 'package:flutter_todo/components/delete_button.dart';
import 'package:flutter_todo/screens/home/body.dart';
import 'package:flutter_todo/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<String>?> tasks = getTasks();

  setTasks() {
    setState(() {
      tasks = getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(tasks: tasks, setTasks: setTasks),
      floatingActionButton: DeleteBtn(
        setTasks: setTasks,
      ),
    );
  }
}

import 'package:flutter_todo/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> updateTasks(String title) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    var prevTasksList = prefs.getStringList(kTasksListKey);

    if (prevTasksList == null) {
      prefs.setStringList(kTasksListKey, [title]);
    } else {
      prefs.setStringList(kTasksListKey, [...prevTasksList, title]);
    }

    return true;
  } catch (e) {
    return false;
  }
}

Future<List<String>?> getTasks() async {
  try {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(kTasksListKey);
  } catch (e) {
    print(e);
    return null;
  }
}

void deleteAllTasks() async {
  try {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(kTasksListKey);
  } catch (e) {
    print(e);
  }
}

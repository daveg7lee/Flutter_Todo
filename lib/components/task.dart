import 'package:flutter/material.dart';
import 'package:flutter_todo/constant.dart';

class Task extends StatefulWidget {
  const Task({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: Row(
          children: <Widget>[
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontSize: 20,
                color: isChecked ? kGrey : kTextColor,
              ),
              child: Text(
                widget.title,
              ),
            ),
            const Spacer(),
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: const CircleBorder(),
                splashRadius: 15,
                activeColor: kPrimaryColor,
                value: isChecked,
                side: const BorderSide(color: kGrey, width: 2),
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

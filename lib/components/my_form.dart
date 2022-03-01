import 'package:flutter/material.dart';
import 'package:flutter_todo/constant.dart';
import 'package:flutter_todo/utils.dart';

class MyForm extends StatelessWidget {
  MyForm({Key? key, required this.setTasks}) : super(key: key);
  final Function setTasks;

  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Form(
            key: formKey,
            child: Input(),
          ),
        ),
        AddBtn()
      ],
    );
  }

  Widget AddBtn() {
    return SizedBox(
      width: 80,
      height: 80,
      child: TextButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState?.save();
          }
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => kPrimaryColor),
          shape: MaterialStateProperty.resolveWith(
              (states) => const CircleBorder()),
        ),
        child: const Icon(
          Icons.add,
          color: kAccentColor,
          size: 40,
        ),
      ),
    );
  }

  Widget Input() {
    return TextFormField(
      maxLength: 30,
      controller: textController,
      decoration: const InputDecoration(
        labelText: "Add Some Task",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Some Task!";
        }
        return null;
      },
      onSaved: (value) {
        // To Do: check it was success
        updateTasks(value!);
        textController.clear();
        setTasks();
      },
    );
  }
}

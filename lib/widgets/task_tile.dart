import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkboxCallback;
  final void Function() longPressCallback;

  const TaskTile({super.key, required this.taskTitle, required this.isChecked, required this.checkboxCallback, required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      // TODO: confirmation on delete
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Delete Task"),
              content: const Text("Do you want to delete this task?"),
              actions: [
                TextButton(
                  onPressed: (){
                    longPressCallback();
                    Navigator.pop(context);
                  },
                  child: const Text("Yes"),
                ),
                TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
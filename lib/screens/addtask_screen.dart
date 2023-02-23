import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String? newTaskTitle;

    return Container(
      // this parent container is used to show
      // the rounded edges of the child container below
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
            TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightBlueAccent),
                ),
                onPressed: (){
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle!);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
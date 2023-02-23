import 'package:flutter/material.dart';
import 'package:todoey/screens/addtask_screen.dart';
import 'package:todoey/task_data.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:provider/provider.dart';


class TasksScreen extends StatelessWidget {

  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            // By default, the BottomSheet will take up half the screen
            // For certain screen sizes, this may mean the Add button is obscured
            // Setting the isScrolledControlled property to true to make the modal take up the full screen
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              // To have the AddTaskScreen sit just above the keyboard, we can wrap it inside a SingleChildScrollView
              // which determines the padding at the bottom using a MediaQuery.
              child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: contains menu button and two Text Widget
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // menu button
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // TODO: contains the tasks list
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
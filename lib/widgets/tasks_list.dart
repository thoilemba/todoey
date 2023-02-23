import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/task_data.dart';

class TasksList extends StatelessWidget {

  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Consumer listening for changes in TaskData
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index){
            final task = taskData.tasks![index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(index);
              },
              longPressCallback: () {
                taskData.deleteTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}






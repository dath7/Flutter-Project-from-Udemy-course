import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widget/task_title.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            checkBoxCallBack: (newValue) {
              taskData.updateTask(taskData.tasks[index]);
            },
            onLongPressedCallBack: (() {
              taskData.deleteTask(taskData.tasks[index]);
            }),
          );
        },
        itemCount: taskData.tasks.length,
      ),
    );
  }
}

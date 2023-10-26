import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  static String newTaskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      // border color ( same color like taskscreen color when add screen pop up)
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
          children: [
            const Flexible(
              child: Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              //  avoid use onChanged with stlw to save value to variable
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
              onPressed: () {
                Provider.of<TasksData>(context, listen: false)
                    .addTask(Task(name: newTaskTitle, isDone: false));
                Navigator.pop(context);
              }, // vi khi call callback , no se trigger rebuild => neu newtasktittle o trong ham build no se dc build lai => k co gia tri
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

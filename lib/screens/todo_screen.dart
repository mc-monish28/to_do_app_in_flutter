import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/task.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/task_item.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks = []; // List to store tasks

  void addTask(String taskName) {
    setState(() {
      tasks.add(Task(id: tasks.length.toString(), task: taskName, done: false));
    });
  }

  void toggleTask(Task task) {
    setState(() {
      tasks = tasks.map((t) {
        if (t.id == task.id) {
          return Task(id: t.id, task: t.task, done: !t.done);
        }
        return t;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'taskify',
          style: GoogleFonts.poppins(
            color: Colors.green,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskItem(
              task: tasks[index],
              onToggle: toggleTask,
            );
          },
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onTaskAdded: addTask,
      ),
    );
  }
}

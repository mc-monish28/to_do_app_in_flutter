import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final ValueChanged<Task> onToggle;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: task.done,
          onChanged: (bool? value) {
            onToggle(task);
          },
        ),
        Expanded(
          child: Text(
            '${task.task}', // Display the task name
            style: GoogleFonts.poppins(
              color: Colors.black, // Adjust text color if needed
              decoration:
                  task.done ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}

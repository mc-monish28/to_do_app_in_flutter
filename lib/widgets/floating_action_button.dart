import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final Function(String) onTaskAdded;

  const CustomFloatingActionButton({Key? key, required this.onTaskAdded})
      : super(key: key);

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  TextEditingController _taskController = TextEditingController();
  bool _isAddingTask = false;

  @override
  Widget build(BuildContext context) {
    return _isAddingTask
        ? Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter task name',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_taskController.text.isNotEmpty) {
                      widget.onTaskAdded(_taskController.text);
                      _taskController.clear();
                      setState(() {
                        _isAddingTask = false;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _isAddingTask = false;
                    });
                  },
                ),
              ],
            ),
          )
        : FloatingActionButton(
            onPressed: () {
              setState(() {
                _isAddingTask = true;
              });
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
          );
  }
}

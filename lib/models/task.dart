class Task {
  final String id;
  final String task;
  final bool done;

  Task({
    required this.id,
    required this.task,
    required this.done,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      task: json['task'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'done': done,
    };
  }
}

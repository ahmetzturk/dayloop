class Task {
  Task({
    required this.title,
    this.description = '',
    required this.dateTime,
    this.hasReminder = true,
    this.isDone = false,
  });

  final String title;
  final String description;
  final DateTime dateTime;
  final bool hasReminder;
  bool isDone;
}

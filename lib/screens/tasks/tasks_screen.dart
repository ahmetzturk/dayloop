import 'package:flutter/material.dart';

import 'package:dayloop/models/task.dart';
import 'package:dayloop/screens/tasks/add_task_screen.dart';
import 'package:dayloop/utils/date_format.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // Şimdilik görevler sadece bellekte tutuluyor, SQLite gelince
  // uygulama kapansa da kaybolmayacak
  final List<Task> _tasks = [];

  Future<void> _openAddTask() async {
    final task = await Navigator.push<Task>(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );
    // Kullanıcı kaydetmeden geri döndüyse task boş gelir
    if (task == null) return;

    setState(() {
      _tasks.add(task);
      _tasks.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Görevler')),
      body: _tasks.isEmpty
          ? const Center(
              child: Text(
                'Henüz görev yok.\nEklemek için + düğmesine bas.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      setState(() {
                        task.isDone = value ?? false;
                      });
                    },
                  ),
                  title: Text(
                    task.title,
                    style: task.isDone
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          )
                        : null,
                  ),
                  subtitle: Text(
                    '${formatDate(task.dateTime)} · ${formatTime(task.dateTime)}',
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTask,
        tooltip: 'Görev ekle',
        child: const Icon(Icons.add),
      ),
    );
  }
}

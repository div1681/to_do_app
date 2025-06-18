import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/utilities/Task.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;
  String selectedTag = 'General';

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _saveTask() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final task = Task(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      dueDate: selectedDate ?? DateTime.now(),
      tag: selectedTag,
      userId: user.uid,
      isCompleted: false, // Important: Firestore expects this
    );

    await FirebaseFirestore.instance.collection('tasks').add(task.toJson());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  selectedDate != null
                      ? "Due: ${selectedDate!.toLocal().toString().split(' ')[0]}"
                      : "Select Due Date",
                  style: theme.textTheme.bodyMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _pickDate,
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedTag,
              items: ['General', 'UI/UX', 'Bugfix', 'Work']
                  .map((tag) => DropdownMenuItem(value: tag, child: Text(tag)))
                  .toList(),
              onChanged: (value) => setState(() {
                selectedTag = value ?? 'General';
              }),
              decoration: const InputDecoration(labelText: 'Tag'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}

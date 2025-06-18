import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;
  final String userId;
  final String tag;

  Task({
    this.id = '',
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
    required this.userId,
    this.tag = 'General',
  });

  factory Task.fromMap(String id, Map<String, dynamic> data) {
    return Task(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      dueDate: (data['dueDate'] as Timestamp).toDate(),
      isCompleted: data['isCompleted'] ?? false,
      userId: data['userId'] ?? '',
      tag: data['tag'] ?? 'General',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'isCompleted': isCompleted,
      'userId': userId,
      'tag': tag,
    };
  }
}

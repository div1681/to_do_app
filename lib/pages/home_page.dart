// ✅ FINAL HOMEPAGE CODE WITH TASKS DISPLAY + DISMISSIBLE + FIXED STREAM
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:to_do_app/pages/task_view.dart';
import 'package:to_do_app/utilities/Task.dart';
import 'package:to_do_app/utilities/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SliderDrawerState> _drawerKey =
      GlobalKey<SliderDrawerState>();

  void signoutuser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black;
    final bgColor = theme.scaffoldBackgroundColor;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => const TaskView()),
          );
        },
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.add, color: textColor),
      ),
      body: SliderDrawer(
        key: _drawerKey,
        appBar: AppBar(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TODO.",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: signoutuser,
              icon: Icon(Icons.logout, color: textColor),
            ),
          ],
        ),
        slider: Container(
          padding: const EdgeInsets.all(24),
          color: theme.colorScheme.surfaceVariant,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Text(
                "Menu",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: Icon(Icons.home, color: textColor),
                title: Text("Home", style: TextStyle(color: textColor)),
                onTap: () => _drawerKey.currentState?.closeSlider(),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: textColor),
                title: Text("Settings", style: TextStyle(color: textColor)),
                onTap: () => _drawerKey.currentState?.closeSlider(),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: textColor),
                title: Text("Logout", style: TextStyle(color: textColor)),
                onTap: signoutuser,
              ),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "WORK.",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "You've got work to do.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              const Divider(thickness: 1),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('tasks')
                      .where('userId', isEqualTo: user?.uid)
                      .orderBy('dueDate')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final docs = snapshot.data?.docs ?? [];

                    if (docs.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.inbox, size: 64, color: theme.hintColor),
                            const SizedBox(height: 16),
                            Text(
                              "No tasks yet.",
                              style: TextStyle(
                                fontSize: 18,
                                color: theme.hintColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final doc = docs[index];
                        final data = doc.data() as Map<String, dynamic>;

                        final task = Task.fromMap(doc.id, data);

                        return TaskWidget(task: task);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

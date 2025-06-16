import 'package:flutter/material.dart';

class BrutalistTerminalUI extends StatelessWidget {
  const BrutalistTerminalUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TODO.',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Courier',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.brightness_6,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: const Text(
                          "SIGN OUT",
                          style: TextStyle(fontFamily: 'Courier'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                "YOU HAVE 3 TASKS. DO THEM.",
                style: TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 16),

              // Add Task Field
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Courier',
                      ),
                      decoration: InputDecoration(
                        hintText: 'ENTER TASK...',
                        hintStyle: const TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: const Text("ADD"),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Tasks
              Expanded(
                child: ListView(
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Row(
                        children: [
                          Checkbox(value: false, onChanged: (_) {}),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "WRITE MORE BRUTAL CODE",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Courier',
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.close, color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MpaziScreen extends StatefulWidget {
  const MpaziScreen({super.key});

  @override
  State<MpaziScreen> createState() => _MpaziScreenState();
}

class _MpaziScreenState extends State<MpaziScreen> {
  final List<String> candidates = [
    "Manoj Kumar",
    "Priya Sharma",
    "Rajesh Thakur",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mpazi Village"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(candidates[index]),
            leading: CircleAvatar(
              child: Text(candidates[index][0]),
            ),
          );
        },
      ),
    );
  }
}

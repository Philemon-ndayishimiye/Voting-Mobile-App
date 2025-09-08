
import 'package:flutter/material.dart';

class GitwaScreen extends StatefulWidget {
  const GitwaScreen({super.key});

  @override
  State<GitwaScreen> createState() => _GitwaScreenState();
}

class _GitwaScreenState extends State<GitwaScreen> {
  final List<String> candidates = [
    "Anita Mukasa",
    "David Nshimiyimana",
    "Fatima Uwimana",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gitwa Village"),
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

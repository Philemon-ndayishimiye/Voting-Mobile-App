 import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _ItuzeScreenState();
}

class _ItuzeScreenState extends State<AdminScreen> {
  final List<String> candidates = [
    "Asha Verma",
    "Ravi Singh",
    "Sunita Yadav",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ituze Village"),
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

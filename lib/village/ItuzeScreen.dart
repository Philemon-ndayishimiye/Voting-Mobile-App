import 'package:flutter/material.dart';

class ItuzeScreen extends StatefulWidget {
  const ItuzeScreen({super.key});

  @override
  State<ItuzeScreen> createState() => _ItuzeScreenState();
}

class _ItuzeScreenState extends State<ItuzeScreen> {
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

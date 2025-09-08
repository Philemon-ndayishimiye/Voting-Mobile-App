import 'package:flutter/material.dart';
import 'package:voting/Screen/Home.dart';
import 'package:voting/Screen/Login.dart';
import 'package:go_router/go_router.dart';
import 'package:voting/Screen/Candidate.dart';
import 'package:voting/village/ItuzeScreen.dart';
import 'package:voting/village/GitwaScreen.dart';
import 'package:voting/village/MpaziScreen.dart';
import 'package:voting/pages/Admin.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/candidates', builder: (context, state) => const Candidates()),
    GoRoute(path: '/ituze', builder: (context, state) => const ItuzeScreen()),
    GoRoute(path: '/gitwa', builder: (context, state) => const GitwaScreen()),
    GoRoute(path: '/mpazi', builder: (context, state) => const MpaziScreen()),
    GoRoute(path: '/admin', builder: (context, state) => const AdminScreen()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'VillageVote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      routerConfig: _router, // <-- use GoRouter here
    );
  }
}

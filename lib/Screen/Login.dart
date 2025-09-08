import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  bool _biometricEnabled = false;
  bool _loading = false; // to show a loading indicator
  final _loginUrl = "https://voting-backend-vy3v.onrender.com/api/auth/login";

  Future<void> _login() async {
    String idCard = _idController.text.trim();

    if (idCard.length != 16) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 16-digit ID.")),
      );
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'identificationCard': idCard}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final token = data['token']?.toString() ?? '';
        final user = data['user'];

        final village = user?['village']?.toString().trim().toLowerCase() ?? '';
        final role = user?['role']?.toString().trim().toLowerCase() ?? '';

        if (token.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login failed: token missing")),
          );
          return;
        }

        // Save token, village, role in shared_preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('village', village);
        await prefs.setString('role', role);

        // Conditional navigation
        if (role == 'admin') {
          context.go('/admin');
        } else {
          switch (village) {
            case 'ituze':
              context.go('/ituze');
              break;
            case 'gitwa':
              context.go('/gitwa');
              break;
            case 'mpazi':
              context.go('/mpazi');
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Village not recognized: '$village'")),
              );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("Login", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Secure Your Access",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Please provide your identification Number to log in.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // ID Input
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your 16-digit identification Card",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Biometric Login
              Row(
                children: [
                  const Icon(Icons.fingerprint, color: Colors.orange),
                  const SizedBox(width: 10),
                  const Text("Enable Biometric Login"),
                  const Spacer(),
                  Switch(
                    value: _biometricEnabled,
                    onChanged: (value) {
                      setState(() {
                        _biometricEnabled = value;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Continue Button
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Continue to Your Village",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

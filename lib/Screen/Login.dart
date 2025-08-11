import 'package:flutter/material.dart';
import 'package:voting/Screen/Selection.dart'; // Import your selection page

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to HomeScreen
          },
        ),
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
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
                "Please provide your details to log in or register.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Phone Number
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: "+250 788 123 456",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // OTP
              TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter the 6-digit code sent to your phone.",
                  suffix: GestureDetector(
                    onTap: () {
                      // Resend OTP action
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Upload National ID
              ElevatedButton.icon(
                onPressed: () {
                  // Upload ID action
                },
                icon: const Icon(Icons.upload_file, color: Colors.orange),
                label: const Text(
                  "Upload National ID",
                  style: TextStyle(color: Colors.orange),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.orange),
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.orange,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Continue Button → Go to Selection page
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Selection()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Continue to AfriVote",
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

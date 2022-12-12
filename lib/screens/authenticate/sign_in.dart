import 'dart:developer';
import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService auth = AuthService();

  // Signin data
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Sign in to Brew Crew'),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            // Username field
            TextFormField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            // Password field
            TextFormField(
              /// obscureText dùng để ẩn kí tự được nhập vào
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            // Nút Signin
            ElevatedButton(
              onPressed: () {
                log(username);
                log(password);
              },
              child: const Text("Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}

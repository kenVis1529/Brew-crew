import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:brewcrew/services/auth.dart';

class Register extends StatefulWidget {
  // Thuộc tính toggleView đại diện cho hàm điều hướng toggleView ở auth.dart
  final Function toggleView;
  const Register({required this.toggleView, super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: const Text('Sign up to Brew Crew'),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          // Nút chuyển tới Sign In form
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: const Text(
              "Sign in",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
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
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}

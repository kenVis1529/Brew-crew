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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Sign in'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic result = await auth.signInAnon();
                if (result == null) {
                  log('Error with signing in');
                } else {
                  log('signed in');
                  log(result.uid.toString());
                }
              },
              child: const Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }
}

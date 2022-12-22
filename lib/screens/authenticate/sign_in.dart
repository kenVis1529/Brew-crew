import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  // Thuộc tính toggleView đại diện cho hàm điều hướng toggleView ở auth.dart
  final Function toggleView;
  const SignIn({required this.toggleView, super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Signin data
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Sign in to Brew Crew'),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          // Nút chuyển tới Register form
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: const Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              // Username field
              TextFormField(
                /// Thuộc tính decoration giúp có thể chỉnh sửa TextField
                ///
                /// Biến textInputDecoration là một Object gồm các thông tin trang trí của TextFormField,
                /// được khai báo ở /shared/constants.dart
                ///
                /// .copyWith() có thể tạo ra một bản sao của Object với thuộc tính và giá trị mới
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (value) => (value == null ? "Enter an email" : null),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              // Password field
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (value) => value!.length < 8
                    ? "Enter a password contains 8+ chars"
                    : null,

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
                onPressed: () async {
                  dynamic result =
                      await _auth.signInWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      error = "Could not sign in with those credentials";
                    });
                  }
                },
                child: const Text("Sign in"),
              ),
              const SizedBox(height: 20.0),

              /// Tạo dòng chữ để hiện lỗi
              Text(
                error,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

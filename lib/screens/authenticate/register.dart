import 'package:flutter/material.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/shared/constants.dart';

class Register extends StatefulWidget {
  // Thuộc tính toggleView đại diện cho hàm điều hướng toggleView ở auth.dart
  final Function toggleView;
  const Register({required this.toggleView, super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  /// _formKey giúp Form kết hợp với Global Key
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
        child: Form(
          /// 1. Kết hợp GlobalKey với Form qua _formKey
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              // Email field
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),

                /// validator dùng để kiểm tra giá trị nhập vào
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
                validator: (value) => (value!.length < 8
                    ? "Enter a password contains 8+ chars"
                    : null),
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
                  /// 2. Mỗi lần bấm nút, validate() sẽ gọi validator của TextFormField ra check
                  if (_formKey.currentState!.validate()) {
                    /// Gọi registerWithEmailAndPassword() để tạo tài khoản mới
                    /// Nếu email không hợp lệ thì trả về result = null và
                    /// nếu email hợp lệ thì chuyển đến Home()
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = "Please give me a valid email";
                      });
                    }
                  }
                },
                child: const Text("Register"),
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

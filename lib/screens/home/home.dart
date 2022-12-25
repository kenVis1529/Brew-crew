import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  Home({super.key});

  /// Biến _auth là gọi hàm signOut()
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    /// Khởi tạo dòng Stream ở Home
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: "").brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: const Text("Brew Crew"),
          elevation: 0.0,
          backgroundColor: Colors.brown[400],

          /// actions là những widgets bên phải thanh Appbars
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}

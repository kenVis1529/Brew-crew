import 'dart:developer';

import 'package:brewcrew/screens/authenticate/authenticate.dart';
import 'package:brewcrew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:brewcrew/modules/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    /// Provider.of<type>(context) sẽ lấy thông tin ở StreamProvider.value (main.dart)
    /// và lưu vào biến user
    final user = Provider.of<MyUser?>(context);
    log(user.toString());

    /// Nếu là user chưa sign up hay bấm log out thì chuyển đến Home page
    /// và signed in rồi thì chuyển đến Authenticate page
    return (user == null) ? const Authenticate() : Home();
  }
}

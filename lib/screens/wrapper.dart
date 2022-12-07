import 'dart:developer';

import 'package:brewcrew/screens/authenticate/authenticate.dart';
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

    return const Authenticate();
  }
}

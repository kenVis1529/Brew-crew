import 'package:brewcrew/screens/authenticate/register.dart';
import 'package:brewcrew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  void initState() {
    super.initState();
  }

  bool showSignIn = true;

  /// Hàm toggleView đổi từ SignIn sang Register và ngược lại
  /// bằng cách đảo giá trị showSignIn
  void toggleView() {
    return setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// showSignIn = true thì hiện SignIn form
    /// và ngược lại thì hiện Register form
    return (showSignIn)
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}

import 'package:brewcrew/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Error: PlatformException (PlatformException(channel-error, Unable to establish connection on channel., null, null))
  /// Vì thiết lập android với Firebase
  /// nên Firebase.initializeApp() chỉ chạy được trên Android device.
  /// Nếu không chạy được trên Android device, hãy thử cold boot.
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Wrapper(),
    );
  }
}

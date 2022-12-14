import 'package:brewcrew/screens/wrapper.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

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
    /// Stream Provider nhận thông tin từ Stream get ở auth.dart
    return StreamProvider.value(
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

import 'dart:developer';
import 'package:brewcrew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brewcrew/modules/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Cập nhật liên tục về thông tin người dùng mỗi lần đăng kí hay đăng nhập
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseuser(user));
  }

  // Dùng để chuyển dữ liệu User của Firebase sang kiểu dữ liệu MyUser của mình
  MyUser? _userFromFirebaseuser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // Sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseuser(user); //Chuyển đổi User sang MyUser hết lun
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Sign In with email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseuser(user);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      /// Tạo một document mới cho người dùng mới
      await DatabaseService(uid: user?.uid)
          .updateUserData("0", "New user", 100);
      return _userFromFirebaseuser(user);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Logout with email
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}

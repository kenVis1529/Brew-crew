import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  /// Cần thuộc tính uid để liên kết chính xác document với tài khoản
  DatabaseService({required this.uid});
  final String? uid;

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

  /// updateUserData dùng để cập nhật thông tin ly coffee của người dùng
  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      "sugar": sugar,
      "name": name,
      "strength": strength,
    });
  }

  /// Hàm stream mà sẽ trả về kết quả của brewCollection
  // get brew stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}

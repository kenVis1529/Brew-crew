import 'package:brewcrew/modules/brew.dart';
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

  // Brew list từ Snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Brew(
              name: doc.get('name') ?? '',
              sugars: doc.get('sugar') ?? '0',
              strength: doc.get('strength') ?? 0,
            ))
        .toList();
  }

  /// Hàm stream mà sẽ trả về kết quả của brewCollection
  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}

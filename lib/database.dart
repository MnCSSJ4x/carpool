import 'package:carpool/LoginForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class DataBaseService {
  //reference to collection

  static final db = FirebaseFirestore.instance.collection('users');
  static Future<bool> exists(String uid, String rnum) async {
    return await (db.where("username", isEqualTo: uid).get())
        .then((value) => value.size > 0 ? true : false);
  }

  static Future updatedata(String uid, String rnum) async {
    User user = User(uid, rnum);
    return await db.doc(uid).set(user.toJson());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getdata(
      String uid, String rnum) {
    return db.doc(uid).snapshots();
  }
}

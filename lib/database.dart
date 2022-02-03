import 'package:carpool/LoginForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class DataBaseService {
  //reference to collection

  static final dbUsers = FirebaseFirestore.instance.collection('users');
  static final dbDates = FirebaseFirestore.instance.collection("dates");
  static Future<bool> exists(String uid, String rnum) async {
    return await (dbUsers.where("username", isEqualTo: uid).get())
        .then((value) => value.size > 0 ? true : false);
  }

  static Future updatedata(User u) async {
    return await dbUsers.doc(u.emailId).set(u.toJson());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getdata(
      String uid, String rnum) {
    return dbUsers.doc(uid).snapshots();
  }
}

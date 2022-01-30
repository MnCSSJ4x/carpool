import 'package:carpool/LoginForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseService {
  static final databaseReference = FirebaseDatabase.instance.ref();
  static DatabaseReference saveData(User user) {
    var id = databaseReference.child('/users').push();
    id
        .set(user.toJson())
        .catchError((error) => print('You got an error $error'));
    return id;
  }

  static void updateDatabase(User user, DatabaseReference id) {
    id.update(user.toJson());
  }

  final CollectionReference userCollection=FirebaseFirestore.instance.collection('user');
  final String uid;
  DataBaseService({required this.uid});
  Future updateUserData(String emailId,String rollNumber)async
  {
    return await userCollection.add(
      {
        "emailID":emailId,
        "rollNumber":rollNumber,
      }
    );
  }
}

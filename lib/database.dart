import 'package:carpool/LoginForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'user.dart';

class DataBaseService {
  //reference to collection

  static final dbUsers = FirebaseFirestore.instance.collection('users');
  static final dbDates = FirebaseFirestore.instance.collection('dates');
  static Future<bool> exists(String uid, String rnum) async {
    return await (dbUsers.where("username", isEqualTo: uid).get()).then((value) => value.size > 0 ? true : false);
  }

  static Future updatedata(User u) async {
    return await dbUsers.doc(u.emailId).set(u.toJson());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getdata(String uid) {
    return dbUsers.doc(uid).snapshots();
  }

  // ignore: non_constant_identifier_names
  static Future AddRecord(DateTime date) async {
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = newFormat.format(date);

    return await dbDates.doc(dt).set(await LoginForm.u.dateJson(date));
  }

  static Future<List<BookingRecord>> getBookingRecordsbyDate(String date) async {
    //dbUsers -> database as a list

    dynamic recs = dbDates.doc(date).get();
    return recs.toObject<List<BookingRecord>>();
  }
  //Dates-> has date -> h<>as -> record ;

  static Future IntervalHandling() async {
    //for all dates ; do
    //check that date in date database,
    //for all intervals overlaping
    //  add the info of mathcing to the user class
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:interval_tree/interval_tree.dart';
import 'package:intl/intl.dart';
import 'package:carpool/database.dart';

class BookingRecord {
  String bookingID;
  Interval interval;
  String uid;
  BookingRecord(this.bookingID, this.interval, this.uid);
}

class User {
  String emailId;
  String rollNumber;
  late Map<DateTime, List<BookingRecord>>
      dateRecords; // All the records based on date of the user only
  late List<BookingRecord> bookingRecords; // All the booking record
  Map travelTime = <DateTime, IntervalTree>{};

  void addUserToDatabase(String emailId, rollNumber) {
    this.emailId = emailId;
    this.rollNumber = rollNumber;
  }

  User(this.emailId, this.rollNumber) {
    // TODO: fetch from database the dateRecords which will be stored for a old user
    // TODO: then fetch all the bookingRecord for the person (Only upcoming ones)
  }

  void addBooking(DateTime date, int startHour, int endHour) {
    // TODO: make a new booking record, add it to the bookingRecords.
    // TODO: add it to apropriate Date Record
  }

  void updateUser() {
    DataBaseService.updatedata(this);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    var newFormat = DateFormat("yyyy-MM-dd");
    travelTime.forEach((key, value) {
      map[newFormat.format(key)] = makeList(value);
    });
    Map<String, dynamic> json = {
      'emailid': emailId,
      'rollnum': rollNumber,
      'map': map,
    };
    return json;
  }

  List<List<int>> makeList(IntervalTree it) {
    List<List<int>> list = [];
    it.toList().forEach((element) {
      list.add([element.start, element.end]);
    });
    return list;
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:interval_tree/interval_tree.dart';
import 'package:intl/intl.dart';
import 'package:carpool/database.dart';

class BookingRecord {
  String bookingID;
  Interval interval;
  String uid;
  BookingRecord(this.bookingID, this.interval, this.uid);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'bid': bookingID,
      'interval': [interval.start, interval.end],
      'uid': uid,
    };
  }
}

class User {
  String emailId;
  String rollNumber;
  late List<DateTime>
      dateRecords; // All the records based on date of the user only
  late List<BookingRecord> bookingRecords; // All the booking record
  Map travelTime = <DateTime, IntervalTree>{};

  void addUserToDatabase(String emailId, rollNumber) {
    this.emailId = emailId;
    this.rollNumber = rollNumber;
  }

  User(this.emailId, this.rollNumber) {
    dateRecords = [];
    bookingRecords = [];
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

  Map<String, dynamic> dateJson(DateTime date) {
    Map<String, dynamic> json = <String, dynamic>{};
    bookingRecords.forEach((element) {
      json[element.bookingID] = element.toJson();
    });
    return json;
  }

  Map<String, dynamic> toJson() {
    List<String> dateRec = [];
    var newFormat = DateFormat("yyyy-MM-dd");
    dateRecords.forEach((element) {
      dateRec.add(newFormat.format(element));
    });
    Map<String, dynamic> json = {
      'emailid': emailId,
      'rollnum': rollNumber,
      'map': dateRec
    };
    return json;
  }
}

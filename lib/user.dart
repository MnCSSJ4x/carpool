import 'package:firebase_database/firebase_database.dart';
import 'package:interval_tree/interval_tree.dart';
import 'package:intl/intl.dart';
import 'package:carpool/database.dart';

class BookingRecord {
  List<Interval> intervals = [];
  String uid;
  String date;
  BookingRecord(this.uid, this.date);

  void addInterval(Interval interval) {
    intervals.add(interval);
  }

  Map<String, dynamic> toJson() {
    List<List<int>> intervals = [];
    this.intervals.forEach((element) {
      intervals.add([element.start, element.end]);
    });
    return <String, dynamic>{'interval': intervals, 'uid': uid, 'date': date};
  }

  @override
  // ignore: hash_and_equals
  bool operator ==(Object bookingRecord) {
    if (runtimeType != bookingRecord.runtimeType) {
      return false;
    }
    bookingRecord as BookingRecord;
    if (bookingRecord.uid == uid) {
      return true;
    }
    return false;
  }

  //database sein user wala access karo. see all dates for booking
  //date == humare date , add booking record to list .
  //parse to JSON

}

class User {
  String emailId;
  String rollNumber;
  late List<DateTime> dateRecords; // All the records based on date of the user only
  late List<BookingRecord> bookingRecords; // All the booking record
  //Map travelTime = <DateTime, IntervalTree>{};

  void addUserToDatabase(String emailId, rollNumber) {
    this.emailId = emailId;
    this.rollNumber = rollNumber;
  }

  User({
    required String this.rollNumber,
    required String this.emailId,
    required List<DateTime> this.dateRecords,
  }) {
    dateRecords = [];
    bookingRecords = [];
    // TODO: fetch from database the dateRecords which will be stored for a old user

    // TODO: then fetch all the bookingRecord for the person (Only upcoming ones)
  }

  void addBooking(DateTime date, int startHour, int endHour) {
    // TODO: make a new booking record, add it to the bookingRecords.
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = newFormat.format(date);
    bookingRecords.forEach((element) {
      if (element.date == dt) {
        element.addInterval(Interval(startHour, endHour));
      }
    });
    // TODO: add it to apropriate Date Recordfactory User.fromJson(Map<String, dynamic> data) {
  }

  Future<void> fetchBookingRecord() async {
    dateRecords.forEach((element) async {
      var newFormat = DateFormat("yyyy-MM-dd");
      String dt = newFormat.format(element);
      List<BookingRecord> arr = await DataBaseService.getBookingRecordsbyDate(dt); // lets say we got an array
      bool flag = false;
      late BookingRecord reqRecord;
      arr.forEach((element) {
        if (element.uid == emailId) {
          flag = true;
          reqRecord = element;
        }
      });
      if (flag) {
        bookingRecords.add(reqRecord);
      }
    });
  }

  Future<Map<String, dynamic>> dateJson(DateTime date) async {
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = newFormat.format(date);
    List<BookingRecord> arr = await DataBaseService.getBookingRecordsbyDate(dt);
    bool flag = true;
    bookingRecords.forEach((element) {
      if (element.date == dt) {
        for (int i = 0; i < arr.length; i++) {
          if (arr[i] == element) {
            arr[i] = element;
            flag = false;
            break;
          }
        }
      }
      if (flag) {
        arr.add(element);
      }
    });
    return <String, dynamic>{'list': arr};
  }

  Map<String, dynamic> toJson() {
    List<String> dateRec = [];
    var newFormat = DateFormat("yyyy-MM-dd");
    dateRecords.forEach((element) {
      dateRec.add(newFormat.format(element));
    });
    Map<String, dynamic> json = {'emailid': emailId, 'rollnum': rollNumber, 'dates': dateRec};
    return json;
  }

  factory User.fromJson(Map<String, dynamic> data) {
    final String emailId = data['emailId'] as String;
    final String rollNumber = data['rollNumber'] as String;
    late List<DateTime> dateRecords = data['dateRecords'] as List<DateTime>;

    return User(emailId: emailId, rollNumber: rollNumber, dateRecords: dateRecords);
  }
}

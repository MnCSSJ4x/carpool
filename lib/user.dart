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
    List<Map<String, dynamic>> intervals = [];
    this.intervals.forEach((element) {
      intervals.add({});
      intervals.last["list"] = [element.start, element.end];
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
    bookingRecords = [];
    // TODO: fetch from database the dateRecords which will be stored for a old user

    // TODO: then fetch all the bookingRecord for the person (Only upcoming ones)
  }

  void addBooking(DateTime date, int startHour, int endHour) {
    // TODO: make a new booking record, add it to the bookingRecords.
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = newFormat.format(date);
    bool flag = true;
    bookingRecords.forEach((element) {
      if (element.date == dt) {
        element.addInterval(Interval(startHour, endHour));
        flag = false;
      }
    });
    if (flag) {
      BookingRecord br = BookingRecord(emailId, dt);
      br.addInterval(Interval(startHour, endHour));
      bookingRecords.add(br);
    }
    if (!dateRecords.contains(date)) {
      dateRecords.add(date);
    }
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

  void update() {
    DataBaseService.updatedata(this);
    dateRecords.forEach((element) {
      DataBaseService.AddRecord(element);
    });
  }

  Future<Map<String, dynamic>> dateJson(DateTime date) async {
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = newFormat.format(date);
    late List<BookingRecord> arr;
    try {
      arr = await DataBaseService.getBookingRecordsbyDate(dt);
    } catch (e) {
      arr = [];
    }
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
    List<Map<String, dynamic>> out = [];
    arr.forEach((element) {
      out.add(element.toJson());
    });
    return <String, dynamic>{'list': out};
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

  factory User.fromJson(Map<String, dynamic>? data) {
    final String emailId = data!['emailid'] as String;
    final String rollNumber = data['rollnum'] as String;
    List<dynamic> temp = data['dates'] as List<dynamic>;
    List<DateTime> dateRecords = [];
    temp.forEach((element) => {dateRecords.add(DateTime.parse(element))});

    return User(emailId: emailId, rollNumber: rollNumber, dateRecords: dateRecords);
  }
}

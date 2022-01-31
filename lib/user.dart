import 'package:firebase_database/firebase_database.dart';
import 'package:interval_tree/interval_tree.dart';
import 'package:intl/intl.dart';
import 'package:carpool/database.dart';

class User {
  late String emailId;
  late String rollNumber;
  late String date; //baadme chnge krna hai ise
  late String time;
  late int posFlexibility = 30, negFlexibility = 30; //in minutes
  Map travelTime = <DateTime, IntervalTree>{};

  void addUserToDatabase(String emailId, rollNumber) {
    this.emailId = emailId;
    this.rollNumber = rollNumber;
  }

  User(this.emailId, this.rollNumber);

  void addBooking(DateTime date, int startHour, int endHour) {
    if (travelTime.containsKey(date)) {
      travelTime[date]!.add(Interval(startHour, endHour));
      return;
    }
    travelTime[date] = IntervalTree();
    travelTime[date]!.add(Interval(startHour, endHour));
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
      'posFlexibility': posFlexibility,
      'negFlexibility': negFlexibility,
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

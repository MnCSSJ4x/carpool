import 'package:flutter/material.dart';
import 'package:carpool/user.dart';
import 'package:carpool/LoginForm.dart';
import 'package:interval_tree/interval_tree.dart' as a;
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home ({Key? key}) : super(key: key);
  @override
  Homepage createState() {
    print("Createstate called");
    return Homepage();
  }
}

class Homepage extends State<Home>{
  Widget presentwidget = Container(
      child: Center(
        child: Text(
          "You have no bookings available for the selected date.",
          style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
        ),
      )
  );
  List<a.Interval>? userintervals;

  @override
  Widget build(BuildContext context) {
    //bookings();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: presentwidget,
      ),
    );
  }

  void bookings() {
      if(userintervals!=null) {
        print(0);
        presentwidget = Container(
          child: ListView.builder(
            itemCount: userintervals!.length,
            itemBuilder: (BuildContext context, int index) {
              //print(LoginForm.u.present);
              String starttime = userintervals![index].start.toString() + ":00";
              String endtime = userintervals![index].end.toString() + ":00";
              return ListTile(
                leading: Icon(
                  Icons.car_rental,
                  color: Colors.white,
                ),
                title: Text(
                  "Booking Time: $starttime to $endtime",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.red,
              );
            },
          ),
        );
      }
      else{
        print(1);
        presentwidget = Container(
            child: Center(
              child: Text(
                "You have no bookings available for the selected date.",
                style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
              ),
            )
        );
      }
    ;
  }


  void setbookings() async{
    print("setbookings called");
    List<BookingRecord> temp = LoginForm.u.bookingRecords;
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = newFormat.format(LoginForm.u.present!);
    for(int i=0; i<temp.length; i++) {
      if(dt==temp[i].date){
        userintervals = temp[i].intervals;
      }
    }
    bookings();
  }
}
import 'package:flutter/material.dart';
import 'package:carpool/user.dart';
import 'package:carpool/LoginForm.dart';
import 'package:interval_tree/interval_tree.dart' as a;
import 'package:intl/intl.dart';
import 'package:carpool/bookingdetails.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  static Homepage homep = Homepage();
  @override
  Homepage createState() {
    print("Createstate called");
    homep = new Homepage();
    return homep;
  }
}

enum Options { Remove, ShowDetails }

class Homepage extends State<Home> {
  Widget presentwidget = Container(
      child: const Center(
    child: Text(
      "You have no bookings available for the selected date.",
      style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
    ),
  ));

  // List<a.Interval> userintervals = [];

  User curUser = LoginForm.u;
  late BookingRecord? curBookingRecord;
  late int curIntervalIndex;

  bool didOpenDialog = false;

  Future<void> OpenDialog() async {
    didOpenDialog = true;
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color(0xFF212121),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            title: const Center(
              child: Text(
                "Booking Options",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Options.ShowDetails);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Show Details",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Color(0xFF303030),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Options.Remove);
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Cancel Booking",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ],
          );
        })) {
      case Options.ShowDetails:
        // Let's go.
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingDetails("11-02-2022", "2:00", "3:00", br: curBookingRecord)));
        // TODO: connect with backend
        print("show details clicked");
        break;
      case Options.Remove:
        //remove stuff from databse
        //call build ui
        if (curIntervalIndex != -1) {
          LoginForm.u.deleteBooking(curBookingRecord!, curBookingRecord!.intervals[curIntervalIndex]);
        }

        print("remove clicked");
        break;
    }
    curIntervalIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    setbookings();
    return Scaffold(backgroundColor: Colors.black, body: presentwidget);
  }

  void bookings() {
    setState(() {
      if (curBookingRecord != null) {
        if (curBookingRecord!.intervals.isNotEmpty) {
          print(0);
          presentwidget = Container(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: curBookingRecord!.intervals.length,
              itemBuilder: (BuildContext context, int index) {
                //print(LoginForm.u.present);
                String starttime = curBookingRecord!.intervals[index].start.toString() + ":00";
                String endtime = curBookingRecord!.intervals[index].end.toString() + ":00";

                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                        leading: const Icon(
                          Icons.car_rental,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Booking Time: $starttime to $endtime",
                          style: const TextStyle(color: Colors.white),
                        ),
                        tileColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              curIntervalIndex = index;
                              OpenDialog().then((value) => bookings());
                            },
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ))),
                  ),
                );
              },
            ),
          );
        } else {
          print(1);
          presentwidget = Container(
              child: const Center(
            child: Text(
              "You have no bookings available for the selected date.",
              style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
            ),
          ));
        }
      }
    });
  }

  void setbookings() async {
    print("setbookings called");
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = "";
    if (LoginForm.u.present != null) dt = newFormat.format(LoginForm.u.present!);

    curBookingRecord = null;
    curIntervalIndex = -1;
    curUser = LoginForm.u;

    // I have preset Date, there might be booking on that day or not
    // User -> BookingRecord
    // if (curBookingRecord is null) means that day has no record

    curBookingRecord = curUser.bookingRecordExists(dt);
    bookings();
  }
}

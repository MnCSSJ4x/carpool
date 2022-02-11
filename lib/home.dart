import 'package:flutter/material.dart';
import 'package:carpool/user.dart';
import 'package:carpool/LoginForm.dart';
import 'package:interval_tree/interval_tree.dart' as a;
import 'package:intl/intl.dart';
import 'package:carpool/bookingdetails.dart';

class Home extends StatefulWidget {
  Home ({Key? key}) : super(key: key);

  static Homepage homep = Homepage();
  @override
  Homepage createState() {
    print("Createstate called");
    homep = new Homepage();
    return homep;
  }
}

enum Options{ Remove, ShowDetails }

class Homepage extends State<Home>{
  Widget presentwidget = Container(
      child: const Center(
        child: Text(
          "You have no bookings available for the selected date.",
          style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
        ),
      )
  );
  List<a.Interval> userintervals = [a.Interval(2, 3), a.Interval(5, 6)];

  

  Future<void>OpenDialog()async{
    switch(await showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          backgroundColor: Color(0xFF212121),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          title: const Text(
            "Information about the booking",
            style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: (){Navigator.pop(context,Options.ShowDetails);},
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
              onPressed: (){Navigator.pop(context,Options.Remove);},
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
      }
    ))
    {
      case Options.ShowDetails:
      // Let's go.
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingDetails("11-02-2022", "2:00", "3:00")));
      print("show details clicked");
      break;
      case Options.Remove:
        // ...
      print("remove clicked");
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //bookings();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView.builder(
          padding:const EdgeInsets.all(10),
          itemCount: userintervals.length,
          itemBuilder: (BuildContext context, int index) {
            //print(LoginForm.u.present);
            String starttime = userintervals[index].start.toString() + ":00";
            String endtime = userintervals[index].end.toString() + ":00";

            return Container(
              margin: const EdgeInsets.all(7),
              child: ListTile(
                  leading: const Icon(
                    Icons.car_rental,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Booking Time: $starttime to $endtime",
                    style: const TextStyle(color: Colors.white),
                  ),
                  tileColor: const Color(0xFF319177),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  trailing: IconButton(
                    onPressed: (){
                      OpenDialog();
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ),
                ),
            );
          },
        ),
      ),
    );
  }

  void bookings() {
    setState(() {
          if(userintervals.length != 0) {
        print(0);
        presentwidget = Container(
          child: ListView.builder(
            padding:const EdgeInsets.all(10), 
            itemCount: userintervals.length,
            itemBuilder: (BuildContext context, int index) {
              //print(LoginForm.u.present);
              String starttime = userintervals[index].start.toString() + ":00";
              String endtime = userintervals[index].end.toString() + ":00";
              
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
                  ),
                ),
              );
            },
          ),
        );
      }
      else{
        print(1);
        presentwidget = Container(
            child: const Center(
              child: Text(
                "You have no bookings available for the selected date.",
                style: TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
              ),
            )
        );
      }
    });
  }


  void setbookings() async{
    print("setbookings called");
    bool flag = false;
    List<BookingRecord> temp = LoginForm.u.bookingRecords;
    var newFormat = DateFormat("yyyy-MM-dd");
    String dt = newFormat.format(LoginForm.u.present!);
    for(int i=0; i<temp.length; i++) {
      if(dt==temp[i].date){
        print("bookings found");
        for(int j=0; j<temp[i].intervals.length; j++) {
          userintervals.add(temp[i].intervals[j]);
        }
        flag = true;
        print(userintervals.length);
      }
    }
    if(!flag){
      print("karan");
      userintervals.clear();
    }
    bookings();
  }
}
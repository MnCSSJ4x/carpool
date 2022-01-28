import 'package:flutter/material.dart';

class newBookings extends StatelessWidget {
  newBookings({Key? key}) : super(key: key);
  DateTime? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "ShareCab",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              Text(
                "Add a New Booking",
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              )
            ],
          ),

          leading: const Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              backgroundColor: Colors.black,
            ),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.date_range,
                color: Colors.blue,
              ),
              onPressed: () {
                _showCalendar(context);
              },
            ),
          ]
      ),
      backgroundColor: Colors.grey[900],
    );
  }

  _showCalendar(BuildContext context) async {
    selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2060),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:carpool/LoginForm.dart';


class newBookings extends StatelessWidget {
  newBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
  _showCalendar(BuildContext context) async {
      LoginForm.u.selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime(2060),
      );
  }

}
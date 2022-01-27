import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF191919),
        body: Column(
      children: [
        const SizedBox(
          width: 150,
          height: 150,
        ),
        const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontFamily: 'Helvetica', color: Colors.white),
            )),
        const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'How can we help you !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontFamily: 'Helvetica', color: Colors.white),
            )),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        FloatingActionButton.extended(
          label: const Text('Book My Slot'),
          onPressed: () {}, //goto slot booking
          backgroundColor: Colors.black,
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        FloatingActionButton.extended(
          label: const Text('View Booked Slots'),
          onPressed: () {}, //goto slot booking
          backgroundColor: Colors.blue,
        ),
      ],
    ));
  }
}

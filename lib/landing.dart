import 'package:flutter/material.dart';
import 'package:carpool/home.dart';
import 'package:carpool/newbooking.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator ({Key? key}) : super(key: key);

  @override
  Landing createState() => Landing();
}

class Landing extends State<TabNavigator>{
  int state = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    newBookings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: (){},
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
            backgroundColor: Colors.black,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.add,
                //color: Colors.white,
              ),
            ),
            label: 'New Booking',
            backgroundColor: Colors.black,
          ),
        //   BottomNavigationBarItem(
        //     icon: IconButton(
        //       onPressed: (){},
        //       icon: const Icon(
        //         Icons.person,
        //         color: Colors.white,
        //       ),
        //     ),
        //     label: 'Search',
        //     backgroundColor: Colors.black,
        //   ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: state,
        onTap: (index){
              setState(() {
                state = index;
              });
          },
        backgroundColor: Colors.black,
      ),
      body: _widgetOptions.elementAt(state),
      backgroundColor: Colors.white,
      );
  }

}

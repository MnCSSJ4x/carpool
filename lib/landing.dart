import 'package:flutter/material.dart';
import 'package:carpool/home.dart';
import 'package:carpool/newbooking.dart';
import 'package:carpool/LoginForm.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator ({Key? key}) : super(key: key);

  @override
  Landing createState(){
    return Landing();
  }
}

class Landing extends State<TabNavigator>{
  int state = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Color(0xFF424242)),
          )
        ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
            backgroundColor: Colors.black,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.add,
                color: Colors.blue,
            ),
            label: 'New Booking',
            backgroundColor: Colors.black,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: state,
        onTap: (index){
              pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
          },
        backgroundColor: Colors.black,

      ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            state = index;
          });
        },
        children: [
          Home(),
          newBookings(),
        ],
      ),
      backgroundColor: Colors.black,

      );
  }
}

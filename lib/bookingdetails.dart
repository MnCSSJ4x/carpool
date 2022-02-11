import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget{
  const BookingDetails(this.date, this.starttime, this.endtime, {Key? key}) : super(key: key);
  final String date;
  final String starttime;
  final String endtime;
  
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
                  "Booking Details",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                )
              ],
            ),
          leadingWidth: 70,
          leading: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            heroTag: "button1",
            onPressed: (){
  // TODO: Add Navigator pop 
            },
            backgroundColor: Colors.black,
            child:Row(
              children: <Widget>[
                Icon(Icons.arrow_back,
                color: Colors.white),
                CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              backgroundColor: Colors.black,
            ),
              ],)),
          backgroundColor: Colors.black,
          shape: const Border(
          bottom: BorderSide(
            color: Color(0xFF424242),
          )
      ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        heroTag: "button2",
        onPressed: (){},
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        )
      ),
     // body: 
    );
  }
  
}
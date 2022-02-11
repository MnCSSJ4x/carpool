import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget{
  late List<Widget> widgetlist;

  BookingDetails(this.date, this.starttime, this.endtime, {Key? key}) : super(key: key){
    widgetlist = [
      const ListTile(
        title: Center(
          child: Text(
            "Details",
            style: TextStyle(color: Colors.blue, fontFamily: 'Helvetica', fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        tileColor: Colors.black,
      ),
      ListTile(
        leading: const Icon(
          Icons.calendar_today_sharp,
          color: Colors.blue,
          size: 22,
        ),
        title: Text(
          "Date: $date",
          style: const TextStyle(color: Colors.white, fontFamily: 'Helvetica', fontSize: 15),
        ),
        tileColor: Colors.black,
      ),
      ListTile(
        leading: const Icon(
          Icons.lock_clock,
          color: Colors.blue,
          size: 22,
        ),
        title: Text(
          "Time Slot: $starttime Hours to $endtime Hours",
          style: const TextStyle(color: Colors.white, fontFamily: 'Helvetica', fontSize: 15),
        ),
        tileColor: Colors.black,
      ),
      const ListTile(
        title: Center(
          child: Text(
            "Available Carpools",
            style: TextStyle(color: Colors.blue, fontFamily: 'Helvetica', fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        tileColor: Colors.black,
      ),
    ];
    }

  final String date;
  final String starttime;
  final String endtime;
  List<String> carpools = ["Ishaan Jalan", "Rudransh Dixit", "hewwo", "manda", "ramesh", "mukesh", "sukesh", "nilesh"];



  @override
  Widget build(BuildContext context) {
    avlblcarpools();
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
              Navigator.pop(context);
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
     body: Scrollbar(
       child: ListView(
       scrollDirection: Axis.vertical,
       shrinkWrap: true,
       padding: EdgeInsets.all(5),
       children: widgetlist,
     ),
    ),
    );
  }

  void avlblcarpools(){
    if(carpools.length!=0){
      for(int i=0; i<carpools.length; i++){

        String name = carpools[i];
           widgetlist.add(
                ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 22,
                ),
                title: Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontFamily: 'Helvetica', fontSize: 15),
                ),
                tileColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
           );
        }
    }
    else{
      widgetlist.add(
          const ListTile(
           title: Center(
            child: Text(
            "Sorry, there are no carpools available in your time slot",
            style: TextStyle(color: Colors.white, fontFamily: 'Helvetica', fontSize: 15),
          ),
        ),
        tileColor: Colors.black,
      ),
      );
    }
  }
}
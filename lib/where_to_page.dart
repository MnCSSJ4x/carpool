import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhereToPage extends StatelessWidget {
   WhereToPage({Key? key}) : super(key: key);
  List<DropdownMenuItem<String>> items = [    
    DropdownMenuItem(child: Text('Select An Option'),
    value: 0 as String),
    DropdownMenuItem(child: Text('Campus'),value:1 as String),
    DropdownMenuItem(child: Text('Airport'),value:2 as String),
  ];
  
  int dropdownValue=0;
  @override
  Widget build(BuildContext context) {
	  final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(color: Colors.black, 
	child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
			Row(mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
			Image.asset(
              'assets/logo.png',
              width: 100,
              height: 50,
              ),
			Padding(
			  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
			  child: const DefaultTextStyle(
              child:Text('ShareCab\n'),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, fontFamily: 'Helvetica'
              )
            ),
			),
			])
			,
			SizedBox(height:0.10
            *screenHeight),
			Padding(
			  padding: EdgeInsets.fromLTRB(0,0,screenWidth*0.7,0),
			  child: DefaultTextStyle(
              child:const Text('Where To ?\n'),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, fontFamily: 'Helvetica'
              )
            ),
			),
			SizedBox(height:0.10
            *screenHeight),
			DropdownButton(
        value: dropdownValue,
        items:items,
        icon:Icon(Icons.arrow_drop_down),
    onChanged: (value) { dropdownValue=value as int;}),
		]
	));
  }
}



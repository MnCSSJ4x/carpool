
// import 'package:carpool/main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class StartScreen extends StatelessWidget{
//   const StartScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context){
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//       color:Colors.black,
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//           Image.asset(
//               'assets/logo.png',
//               width: 200,
//               height: 90,
//               ),
//             const DefaultTextStyle(
//               child:Text('ShareCab\n'),
//               textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, fontFamily: 'Helvetica'
//               )
//             ),
//             SizedBox(height:0.10
//             *screenHeight),
//             ElevatedButton(
//               onPressed: ()=>runApp(const MaterialApp(
//     home: LoginPage(),
//     debugShowCheckedModeBanner: false,
//   )),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: const Text(
//                   'Login',
//                   textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, fontFamily: 'Helvetica'
//             ),
//                 ),
//               )
//       ),
//       SizedBox(height:0.10*screenHeight),
//       ElevatedButton(onPressed: ()=>print("fd\n")
//       , child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//                   'Sign Up',
//                   textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, fontFamily: 'Helvetica', 
//                 ),
//               ),
//       ),
//       )
//       ]
//       )
//       );
//   }

// }


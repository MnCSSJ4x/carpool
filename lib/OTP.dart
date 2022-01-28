import 'package:carpool/auth.dart';
import 'package:carpool/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
class OTP extends StatelessWidget {
  OTP(
      {Key? key,
      @required this.emailidcontroller,
      @required this.rollnumbercontroller})
      : super(key: key);
  final _otpcontroller = TextEditingController();
  final emailidcontroller;
  final rollnumbercontroller;

  final database = DataBaseService();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.black,
            //   title: const Text("Verify OTP"),
            // ),
            backgroundColor: Colors.black,
            body: Padding(
                padding: const EdgeInsets.all(21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Enter OTP",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: 'Helvetica'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _otpcontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF424242),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                      ),
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: ElevatedButton(
                      onPressed: () async {
                        bool flag = await verifyOTP(
                            emailidcontroller, _otpcontroller, context);
                        if (flag) {
                          var db =
                              DataBaseService.databaseReference.child('/users');
                          // db.once().then((DataSnapshot snapshot) {
                          //   // var keys = snapshot.value.keys;
                          //   // var values = snapshot.value;
                          //   // for(var key:keys){

                          //   // }
                          // });
                          DataBaseService.databaseReference
                              .child('/users')
                              .push()
                              .set({
                            'emailid': emailidcontroller.text,
                            'rollnum': rollnumbercontroller.text,
                          }).catchError(
                                  (error) => print('You got an error $error'));
                        }
                      },
                      child: const Text(
                        "Verify OTP",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Helvetica'),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ))
                  ],
                ))));
  }
}

import 'package:carpool/auth.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
class OTP extends StatelessWidget {
  OTP({Key? key, @required this.emailidcontroller}) : super(key: key);
  final _otpcontroller = TextEditingController();
  final emailidcontroller;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("Verify OTP"),
            ),
            body: Padding(
                padding: const EdgeInsets.all(21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _otpcontroller,
                    )),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                        child: ElevatedButton(
                      onPressed: () {
                        verifyOTP(emailidcontroller, _otpcontroller);
                      },
                      child: const Text("Submit OTP"),
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                    ))
                  ],
                ))));
  }
}

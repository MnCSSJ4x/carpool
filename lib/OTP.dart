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
                      style: TextStyle(fontSize: 18, color: Colors.grey, fontFamily: 'Helvetica'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      controller: _otpcontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF424242),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                      ),
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: ElevatedButton(
                      onPressed: () {
                        verifyOTP(emailidcontroller, _otpcontroller, context);
                      },
                      child: const Text(
                          "Verify OTP",
                          style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'Helvetica'),
                        ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),

                    ))
                  ],
                ))));
  }
}

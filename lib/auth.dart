import 'package:carpool/landing.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

void sendOTP(email_id_controller) async {
  EmailAuth.sessionName = "TEST";
  var res = await EmailAuth.sendOtp(receiverMail: email_id_controller.text);
  if (res) {
    print('OTP SENT');
  }
}

void verifyOTP(email_id_controller, otpcontroller, context) async {
  var response = EmailAuth.validate(
      receiverMail: email_id_controller.text, userOTP: otpcontroller.text);
  if (response) {
    print("Verified");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Landing()));
  } else {
    print("wrong");
  }
}
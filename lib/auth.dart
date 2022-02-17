import 'package:carpool/auth.config.dart';
import 'package:carpool/landing.dart';
import 'package:carpool/email_auth.dart';

EmailAuth emailAuth = EmailAuth(sessionName: "TEST");

void sendOTP(email_id_controller) async {
  await emailAuth.config(remoteServerConfiguration);
  bool res = await emailAuth.sendOtp(recipientMail: email_id_controller.text);
  if (res) {}
}

Future<bool> verifyOTP(email_id_controller, otpcontroller, context) async {
  bool response = emailAuth.validateOtp(recipientMail: email_id_controller.text, userOtp: otpcontroller.text);
  if (response) {
    return true;
  } else {
    return false;
  }
}

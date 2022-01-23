import 'package:carpool/auth.dart';
import 'package:carpool/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import 'OTP.dart';


final database=FirebaseDatabase.instance.ref();
String emailid='',rollnum='';
class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.form_key,
    required this.orgid,
    required this.email_id_controller,
    required this.roll_num_controller,
  }) : super(key: key);

  final GlobalKey<FormState> form_key;
  final String orgid;
  final TextEditingController email_id_controller;
  final TextEditingController roll_num_controller;
  
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
      child: (Center(
          child: Card(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value != null) {
                  if (value.contains(orgid) && value.contains("@")) {
                    emailid=value;
                    return null;
                  }
                }
                if (value!.isEmpty) {
                  return 'Enter email please';
                }

                return 'Enter Valid organisation email id';
              },
              controller: email_id_controller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Your Email",
                labelText: "Email ID",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              validator: (value) {
                if (value != null) {
                  if (isAlphanumeric(value)) {
                    rollnum=roll_num_controller.text;
  //TODO: check ki email hai ki nhi nhi hai toh bnao wrna chodhh do
  // +flexibility,-flexibility,time,date(2D array jisme time+date ho as a form of array)                 
            //         database.child('/users').push().set({
            //     'emailid':emailid,
            //     'rollnum':rollnum,
            //   }).catchError((error)=>print('You got an error $error'));
			User u=new User(emailid,rollnum);
			u.addBooking("23/01/2022");
			u.addUserToDatabase(emailid, rollnum);
			print(u.getId());
                    return null;
                  }
                }
                return 'Enter Valid rollnumber';
              },
              controller: 
              roll_num_controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Enter Your Rollnumber",
                labelText: "Rollnumber",
              ),
              
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                if (form_key.currentState!.validate()) {
                  //add backend
                  
                  print("Validated");
                  sendOTP(email_id_controller);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OTP(
                                emailidcontroller: email_id_controller,
                              )));
                } else {
                  print("not valid");
                }
              },
              child: const Text("Get OTP"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
            )
          ],
        ),
      )))),
    );
  }
}

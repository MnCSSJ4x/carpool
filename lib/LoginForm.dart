import 'package:flutter/material.dart';

Form LoginForm(email_id_controller, roll_num_controller, form_key) {
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
            controller: roll_num_controller,
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
            onPressed: () {},
            child: const Text("Sign In"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
          )
        ],
      ),
    )))),
  );
}

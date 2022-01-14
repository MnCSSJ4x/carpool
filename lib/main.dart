import 'package:flutter/material.dart';
import 'LoginForm.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: non_constant_identifier_names
  final form_key = GlobalKey<FormState>();
  final email_id_controller = TextEditingController();
  final roll_num_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LoginForm(email_id_controller, roll_num_controller, form_key),
        ],
      ),
    );
  }
}

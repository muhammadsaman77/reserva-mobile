
import 'package:booking_app/presentation/screens/login/login_form.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => MaterialPage(child: LoginPage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
            child:  LoginForm()));
  }
}

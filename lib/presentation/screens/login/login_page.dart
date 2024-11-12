import 'package:booking_app/bloc/auth/auth_bloc.dart';
import 'package:booking_app/presentation/screens/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

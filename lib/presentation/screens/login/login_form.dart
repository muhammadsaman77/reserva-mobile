import 'package:booking_app/bloc/auth/auth_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({super.key});
  void onPressed(BuildContext context) {
    context.read<AuthBloc>().add(
      AuthLoginRequested(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.of(context).pushReplacementNamed('/');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 40),
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                _EmailInput(
                  controller: emailController,
                ),
                const SizedBox(height: 10),
                Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                _PasswordInput(controller: passwordController,),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/forgot-password');
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.red),
                      )),
                ),
                _LoginButton(onPressed: (){
                  onPressed(context);
                },),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: blueNormal),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class _EmailInput extends StatelessWidget {
  final TextEditingController controller;

  const _EmailInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      key: const Key('loginForm_emailInput_textField'),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "Enter your email",
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final TextEditingController controller;

  const _PasswordInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Enter your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final void Function() onPressed;

  const _LoginButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      child: ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: blueNormal,
              foregroundColor: Colors.white),
          onPressed: onPressed,
          child: Text(
            'Login',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}

import 'package:booking_app/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password reset email sent!')),
            );
            context.read<ForgotPasswordBloc>().add(ForgotPasswordCleared());
            Navigator.of(context).pushReplacementNamed('/login');

          } else if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to send password reset email.')),
            );
          }
        },
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20),
          child:Align(
            alignment: const Alignment(0, -1 / 3),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Text("Forgot Password",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 40),
                  const Text("Email",style: TextStyle(fontWeight: FontWeight.w600),),
                  TextField(
                    onChanged: (email) => context
                        .read<ForgotPasswordBloc>()
                        .add(ForgotPasswordEmailChanged(email)),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                      builder: (context, state) {
                        return  state.isSubmitting
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(ForgotPasswordSubmitted());
                            },
                            key: const Key('loginForm_continue_raisedButton'),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: blueNormal,
                                foregroundColor: Colors.white),
                            child: const Text(
                              'Send Reset Email',
                              style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ));
                      }
                    ),
                  ),
                ],
        
              ),
            ),
          ),
        ),
      ),
    );

  }
}

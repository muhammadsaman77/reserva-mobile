import 'package:booking_app/bloc/change_password/change_password_cubit.dart';
import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController currentPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Old Password",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextField(
                obscureText: true,
                controller: currentPasswordController,
                decoration: InputDecoration(
                  hintText: "Enter your old password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "New Password",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextField(
                obscureText: true,
                controller: newPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter your new password",

                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Confirm New Password",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextField(
                obscureText: true,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  hintText: "Enter your confirm new password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: BlocListener<PasswordCubit, PasswordState>(
                  listener: (context, state) {
                    if (state.isLoading) {
                      // Handle loading state if necessary
                    } else if (state.isSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Password successfully updated!")),
                      );
                      Navigator.pop(context); // Navigate back after success
                    } else if (state.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage!)),
                      );
                    }
                  },
                  child: BlocBuilder<PasswordCubit, PasswordState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                            final currentPassword =
                                currentPasswordController.text;
                            final newPassword = newPasswordController.text;
                            final confirmPassword =
                                confirmPasswordController.text;

                            context.read<PasswordCubit>().changePassword(
                                  currentPassword: currentPassword,
                                  newPassword: newPassword,
                                  confirmPassword: confirmPassword,
                                );

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: blueNormal,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

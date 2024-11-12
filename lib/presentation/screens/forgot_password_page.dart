import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child:Align(
          alignment: Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Forgot Password",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
                const SizedBox(height: 40),
                Text("Email",style: TextStyle(fontWeight: FontWeight.w600),),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter your Email",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      key: const Key('loginForm_continue_raisedButton'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: blueNormal,
                          foregroundColor: Colors.white),
                      child: Text(
                        'Send Email Link',
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
              ],

            ),
          ),
        ),
      ),
    );

  }
}

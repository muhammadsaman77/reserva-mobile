import 'package:booking_app/bloc/profile/profile_cubit.dart';
import 'package:booking_app/bloc/profile/profile_state.dart';
import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>().state;
    if (cubit is ProfileLoaded) {
    nameController.text = cubit.name;
    phoneNumberController.text = cubit.phoneNumber;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if(state is ProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text("Username", style: TextStyle(fontWeight: FontWeight.w600),),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),


                    ),

                  ),
                  const SizedBox(height: 16),
                  const Text("Phone Number",  style: TextStyle(fontWeight: FontWeight.w600),),
                  TextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),

                  ),
                  const SizedBox(height: 16),
                  const Text("Photo",style: TextStyle(fontWeight: FontWeight.w600),),
                  FormField(builder: (field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Choose file'),
                    );
                  },),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: blueNormal,
                          foregroundColor: Colors.white),
                      child: const Text('Save',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();

        }
      ),
    );

  }
}

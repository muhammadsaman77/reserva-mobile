import 'package:booking_app/bloc/auth/auth_bloc.dart';
import 'package:booking_app/bloc/profile/profile_cubit.dart';
import 'package:booking_app/bloc/profile/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      },
      child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 24.0),
              child: Center(
      child: Column(

        children: [
          SizedBox(height: 40,),
          const CircleAvatar(
              radius: 80, backgroundImage: AssetImage("assets/images/erine.jpg")),
          const SizedBox(height: 20),
           BlocBuilder<ProfileCubit,ProfileState>(

             builder: (context, state) {
               if (state is ProfileInitial) {

                 context.read<ProfileCubit>().getProfile();
               }
               if( state is ProfileLoaded){

                 return Column(
                   children: [
                     Text(state.name,
                         style: const TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                         )),
                     Text(state.phoneNumber,
                         style: const TextStyle(
                           fontSize: 16,
                         )),
                   ],
                 );
               }
               return Container();
               }

           ),

          const SizedBox(height:  50),
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minTileHeight: 40,
                  leading: const Icon(Icons.edit),
                  title: const Text("Edit Profile",style: TextStyle(fontSize: 14),),
                  onTap: () {
                    Navigator.of(context).pushNamed('/edit-profile');
                  },
                ),
                const SizedBox(height: 10,),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minTileHeight: 40,
                  leading: const Icon(Icons.lock),
                  title: const Text("Edit Password",style: TextStyle(fontSize: 14),),
                  onTap: () {
                    Navigator.of(context).pushNamed('/change-password');
                  },
                ),
                const SizedBox(height: 10,),
                ListTile(
                  minTileHeight: 40,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.logout,),
                  title: const Text("Logout",style: TextStyle(fontSize: 14),),
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogoutRequested());
                  },
                )
              ],
            ),
          )
        ],
      ),
              ),
            ),
    );
  }
}

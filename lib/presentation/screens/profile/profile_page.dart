import 'package:booking_app/bloc/auth/auth_bloc.dart';
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
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric( horizontal: 24.0),
        child: Center(
          child: Column(
            children: [
              Text("Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              CircleAvatar(
                  radius: 80, backgroundImage: AssetImage("assets/images/erine.jpg")),
              SizedBox(height: 20),
              Text("Erine",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              Text("erine@example.com",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              SizedBox(height:  50),
              SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minTileHeight: 40,
                      leading: Icon(Icons.edit),
                      title: Text("Edit Profile",style: TextStyle(fontSize: 14),),
                      onTap: () {
                        Navigator.of(context).pushNamed('/edit-profile');
                      },
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minTileHeight: 40,
                      leading: Icon(Icons.lock),
                      title: Text("Edit Password",style: TextStyle(fontSize: 14),),
                      onTap: () {
                        Navigator.of(context).pushNamed('/change-password');
                      },
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      minTileHeight: 40,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.logout,),
                      title: Text("Logout",style: TextStyle(fontSize: 14),),
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
      )),
    );
  }
}

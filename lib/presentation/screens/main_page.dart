

import 'package:booking_app/presentation/screens/booking_page.dart';
import 'package:booking_app/presentation/screens/home_page.dart';
import 'package:booking_app/presentation/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottom_navigation/bottom_navigation_bloc.dart';
import '../widgets/bottom_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MainPage());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          switch (state.navbarItem) {
            case NavbarItems.home:
              return  HomePage();
            case NavbarItems.schedule:
              return  BookingPage();
            case NavbarItems.profile:
              return const ProfilePage();
          }
    },
    ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

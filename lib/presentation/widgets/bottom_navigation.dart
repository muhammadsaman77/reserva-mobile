import 'package:booking_app/bloc/booking_history/booking_history_bloc.dart';
import 'package:booking_app/bloc/home/home_bloc.dart';
import 'package:booking_app/bloc/profile/profile_cubit.dart';
import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottom_navigation/bottom_navigation_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
        currentIndex: state.index,
        selectedItemColor: blueNormal,
        onTap: (index) {
          if (index == 0) {
            context.read<BottomNavigationBloc>().add(const ChangeBottomNav(NavbarItems.home));
            context.read<HomeBloc>().add(FetchHotels());
          } else if (index == 1) {
            context.read<BottomNavigationBloc>().add(const ChangeBottomNav(NavbarItems.schedule));
            context.read<BookingHistoryBloc>().add(LoadBookingHistory());
          } else if (index == 2) {
            context.read<ProfileCubit>().getProfile();
            context.read<BottomNavigationBloc>().add(const ChangeBottomNav(NavbarItems.profile));
          }
        },
        items:  [
          BottomNavigationBarItem(
            icon: Icon(state.index == 0 ? Icons.home : Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(state.index==1 ? Icons.list_alt_sharp :  Icons.list_alt_outlined),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(state.index==2 ? Icons.person : Icons.person_outline),
            label: "Profile",
          ),
        ],
      );
      },
    );
  }
}
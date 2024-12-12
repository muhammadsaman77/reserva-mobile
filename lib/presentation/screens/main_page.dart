import 'package:booking_app/bloc/search/search_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:booking_app/presentation/screens/booking_page.dart';
import 'package:booking_app/presentation/screens/home_page.dart';
import 'package:booking_app/presentation/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottom_navigation/bottom_navigation_bloc.dart';
import '../widgets/bottom_navigation.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final TextEditingController _searchController = TextEditingController();

  static Page<void> page() => MaterialPage<void>(child: MainPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        // Adjust the height as needed
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            switch (state.navbarItem) {
              case NavbarItems.home:
                return AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: blueNormal,
                  foregroundColor: Colors.white,
                  title: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      final bloc = context.read<SearchBloc>();
                      return bloc.isSearching
                          ? TextField(
                              controller: _searchController,
                              onChanged: (query) => context
                                  .read<SearchBloc>()
                                  .add(FetchSearchResults(query)),
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white60),
                              ),
                              style: const TextStyle(color: Colors.white),
                            )
                          : const Text(
                              'Reserva',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            );
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          final bloc = context.read<SearchBloc>();
                          return Icon(
                              bloc.isSearching ? Icons.close : Icons.search);
                        },
                      ),
                      onPressed: () =>
                          context.read<SearchBloc>().add(ToggleSearchEvent()),
                    ),
                    IconButton(onPressed: (){
                      Navigator.of(context).pushNamed('/chat');
                    }, icon: const Icon(Icons.chat)),
                  ],
                );

              case NavbarItems.schedule:
                return AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: blueNormal,
                  foregroundColor: Colors.white,
                  title: const Text(
                    "My Booking",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                );
              case NavbarItems.profile:
                return AppBar(
                  automaticallyImplyLeading: false,
                 centerTitle: true,
                  backgroundColor: blueNormal,
                  foregroundColor: Colors.white,
                 title:  const Text("Profile",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                );
            }
          },
        ),
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          switch (state.navbarItem) {
            case NavbarItems.home:
              return HomePage();
            case NavbarItems.schedule:
              return const BookingPage();
            case NavbarItems.profile:
              return const ProfilePage();
          }
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

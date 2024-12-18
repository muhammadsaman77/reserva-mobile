import 'package:booking_app/bloc/auth/auth_bloc.dart';
import 'package:booking_app/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:booking_app/bloc/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashBloc, SplashState>(listener: (context, state) {
          if (state is SplashLoaded) {
            context.read<AuthBloc>().add(AuthCheckRequested());
          }
        }),
        BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.read<BottomNavigationBloc>().add(const ChangeBottomNav(NavbarItems.home));
      Navigator.of(context).pushReplacementNamed('/');
          }
          else if (state is AuthUnauthenticated) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },)
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo atau gambar
              Image.asset(
                'assets/images/splash.png',
                height: 150.0,
                width: 150.0,
              ),
              const SizedBox(height: 20.0),
              // Text di bawah logo
              const Text(
                'Reserva',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

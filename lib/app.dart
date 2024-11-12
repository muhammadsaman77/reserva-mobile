import 'package:booking_app/bloc/auth/auth_bloc.dart';
import 'package:booking_app/bloc/home/home_bloc.dart';
import 'package:booking_app/bloc/scroll/scroll_cubit.dart';
import 'package:booking_app/bloc/splash/splash_bloc.dart';
import 'package:booking_app/presentation/screens/booking_detail.dart';
import 'package:booking_app/presentation/screens/edit_password_page.dart';
import 'package:booking_app/presentation/screens/detail_page.dart';
import 'package:booking_app/presentation/screens/forgot_password_page.dart';
import 'package:booking_app/presentation/screens/login/login_page.dart';
import 'package:booking_app/presentation/screens/main_page.dart';
import 'package:booking_app/presentation/screens/profile/edit_profile.dart';
import 'package:booking_app/presentation/screens/signup/signup_page.dart';
import 'package:booking_app/presentation/screens/splash_page.dart';
import 'package:booking_app/presentation/screens/success_page.dart';
import 'package:booking_app/repository/api_client.dart';
import 'package:booking_app/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import 'bloc/bottom_navigation/bottom_navigation_bloc.dart';

class App extends StatelessWidget {
  final AuthRepository authRepository;

  final ApiClient apiClient;
   App({super.key, required this.authRepository}): apiClient = ApiClient(Dio());

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>AuthBloc(authRepository: authRepository)
              ..add(AuthCheckRequested())
          ),
          BlocProvider(create: (_)=>BottomNavigationBloc()),
          BlocProvider(create: (_)=>ScrollCubit()),
          BlocProvider(create: (_)=> SplashBloc()..add(SplashStarted())),
          BlocProvider(create: (_)=>HomeBloc(apiClient.homeRepository)),
        ],
        child: const AppView(),

      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData(),
      routes: {
        '/signup': (context) =>  SignupPage(),
        '/login': (context) => const LoginPage(),
        '/detail': (context) =>  DetailPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/change-password': (context) => const ChangePasswordPage(),
        '/success': (context) => const SuccessPage(),
        '/': (context)=> const MainPage(),
        '/splash': (context) =>  SplashPage(),
        '/booking-detail': (context) =>  BookingDetail(),
        '/edit-profile': (context) =>  EditProfilePage(),
      },
      initialRoute: '/splash',
    );

  }
  ThemeData _themeData() {
    var baseTheme = ThemeData();

    return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
    );
  }
}

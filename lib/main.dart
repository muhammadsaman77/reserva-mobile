import 'package:bloc/bloc.dart';
import 'package:booking_app/app.dart';
import 'package:booking_app/repository/api_client.dart';
import 'package:booking_app/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'bloc/app_observer.dart';
import 'package:booking_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authRepository = AuthRepository();

  runApp(App(authRepository: authRepository));
}

part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String username;
  final String phoneNumber;
  AuthSignUpRequested({required this.username,required this.phoneNumber,required this.email, required this.password,});

}

class AuthLogoutRequested extends AuthEvent {}
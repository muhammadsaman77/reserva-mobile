part of 'password_cubit.dart';
class PasswordState {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  PasswordState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });
}
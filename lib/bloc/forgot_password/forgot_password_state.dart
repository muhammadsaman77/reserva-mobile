part of 'forgot_password_bloc.dart';
class ForgotPasswordState extends Equatable {
  final String email;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const ForgotPasswordState({
    required this.email,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory ForgotPasswordState.initial() {
    return const ForgotPasswordState(
      email: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ForgotPasswordState copyWith({
    String? email,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object> get props => [email, isSubmitting, isSuccess, isFailure];
}
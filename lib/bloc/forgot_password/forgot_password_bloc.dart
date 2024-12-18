import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ForgotPasswordBloc()
      :
        super(ForgotPasswordState.initial()) {
    on<ForgotPasswordEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<ForgotPasswordSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false));
      try {
        await _firebaseAuth.sendPasswordResetEmail(email: state.email);
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(isSubmitting: false, isFailure: true));
      }
    });
    on<ForgotPasswordCleared>((event, emit) {
      emit(ForgotPasswordState.initial());
    });
  }
}

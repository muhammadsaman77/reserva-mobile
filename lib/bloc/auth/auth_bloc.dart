import 'package:booking_app/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthCheckRequested>((event, emit) async {
      final session = authRepository.getCurrentUser();
      if (session != null) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    });
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response =
            await authRepository.signIn(event.email, event.password);
        if (response != null) {
          emit(AuthAuthenticated());
        } else {
          emit(AuthError(message: 'Login Failed'));
        }
      } catch (e) {

        emit(AuthError(message: e.toString()));
      }
    });
    on<AuthSignUpRequested>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final response = await authRepository.signUp(
              username: event.username,
              phoneNumber: event.phoneNumber,
              email: event.email,
              password: event.password,);

          if (response != null) {
            emit(AuthAuthenticated());
          } else {
            emit(AuthError(message: 'Sign Up Failed'));
          }
        } catch (e) {

          emit(AuthError(message: e.toString()));
        }
      },
    );
    on<AuthLogoutRequested>(
      (event, emit) async {
        await authRepository.signOut();
        emit(AuthUnauthenticated());
      },
    );
  }
}

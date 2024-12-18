import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';
class PasswordCubit extends Cubit<PasswordState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  PasswordCubit() : super(PasswordState());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword
  }) async {
    emit(PasswordState(isLoading: true));

    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception("User is not logged in");
      }
      if (newPassword != confirmPassword) {
        throw Exception("Passwords do not match");
      }
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);

      // Update password
      await user.updatePassword(newPassword);

      emit(PasswordState(isSuccess: true));
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred.";
      if (e.code == 'wrong-password') {
        errorMessage = "The current password is incorrect.";
      } else if (e.code == 'weak-password') {
        errorMessage = "The new password is too weak.";
      }
      emit(PasswordState(errorMessage: errorMessage));
    } catch (e) {
      emit(PasswordState(errorMessage: e.toString()));
    }
  }
}
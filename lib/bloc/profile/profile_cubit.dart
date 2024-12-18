import 'package:bloc/bloc.dart';
import 'package:booking_app/bloc/profile/profile_state.dart';
import 'package:booking_app/data/model/user.dart';
import 'package:booking_app/repository/auth_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final _authRepository = AuthRepository();
  ProfileCubit() : super(ProfileInitial());

  // Simulasi pengambilan data profil
  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      // Simulasi delay untuk fetch data profil
      final User user = await  _authRepository.getFullUser();

      emit(ProfileLoaded(name: user.username!, phoneNumber: user.phoneNumber!,imageUrl: user.imageUrl));
    } catch (e) {

      emit(ProfileError(error: 'Failed to load profile'));
    }
  }

  // Simulasi pembaruan data profil
  Future<void> editProfile(String name, String phoneNumber) async {
    emit(ProfileLoading());

    try {
      // Simulasi delay untuk update data profil
      await Future.delayed(const Duration(seconds: 2));


      emit(ProfileUpdated(name: name, phoneNumber: phoneNumber));
    } catch (e) {

      emit(ProfileError(error: 'Failed to update profile'));
    }
  }
}

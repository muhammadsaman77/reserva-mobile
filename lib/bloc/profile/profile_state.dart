import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String phoneNumber;
  final String? imageUrl;

  ProfileLoaded({required this.name, required this.phoneNumber, this.imageUrl});

  @override
  List<Object?> get props => [name, phoneNumber, imageUrl];
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});

  @override
  List<Object?> get props => [error];
}

class ProfileUpdated extends ProfileState {
  final String name;
  final String phoneNumber;

  ProfileUpdated({required this.name, required this.phoneNumber});

  @override
  List<Object?> get props => [name, phoneNumber];
}

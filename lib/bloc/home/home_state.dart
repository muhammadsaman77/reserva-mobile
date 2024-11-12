part of 'home_bloc.dart';


abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState{}


class HomeLoaded extends HomeState {
  final List<Hotel> data;
  const HomeLoaded(this.data);
  @override
  List<Object> get props => [data];
}


class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
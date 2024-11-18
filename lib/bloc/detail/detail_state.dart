
part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState{}

class DetailLoaded extends DetailState {
  final Hotel hotel;
  final List<Room> rooms;
  const DetailLoaded(this.hotel, this.rooms);

  @override
  List<Object> get props => [hotel, rooms];
}

class DetailError extends DetailState {
  final String message;
  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}



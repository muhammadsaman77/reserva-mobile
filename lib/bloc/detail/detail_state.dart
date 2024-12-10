
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
  final String heroImage;
  const DetailLoaded(this.hotel, this.rooms,this.heroImage);

  @override
  List<Object> get props => [hotel, rooms, heroImage];

  DetailLoaded copyWith({Hotel? hotel, List<Room>? rooms, String? heroImage}) {
    return DetailLoaded(
        hotel ?? this.hotel,
        rooms ?? this.rooms,
        heroImage ?? this.heroImage
    );
  }
}

class DetailError extends DetailState {
  final String message;
  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}



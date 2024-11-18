part of 'detail_bloc.dart';



abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailHotel extends DetailEvent{
  final String id;

  FetchDetailHotel(this.id);

  @override
  List<Object> get props => [id];
}
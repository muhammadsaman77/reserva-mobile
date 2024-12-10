part of 'detail_bloc.dart';



abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailHotel extends DetailEvent{
  final String id;

  const FetchDetailHotel(this.id);

  @override
  List<Object> get props => [id];
}

class ChangeHeroImage extends DetailEvent{
  final String image;

  const ChangeHeroImage(this.image);

  @override
  List<Object> get props => [image];
}

import 'package:booking_app/data/model/hotel.dart';
import 'package:booking_app/data/model/room.dart';
import 'package:booking_app/repository/detail_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository detailRepository = DetailRepository();
  DetailBloc() : super(DetailInitial()) {
    on< FetchDetailHotel>((event, emit) async{
      try{
        emit(DetailLoading());
        Hotel hotel = await detailRepository.getDetailHotel(event.id);
        List<Room> room = await detailRepository.getRooms(event.id);
        print(room);
        emit(DetailLoaded(hotel, room));
      }catch(e){
        print(e);
        emit(DetailError(e.toString()));
      }

    });
  }
}
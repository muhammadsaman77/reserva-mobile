import 'package:booking_app/data/model/hotel.dart';
import 'package:booking_app/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository = HomeRepository();
  HomeBloc() : super(HomeInitial()) {
    on<FetchHotels>((event, emit) async{
      try {
        emit(HomeLoading());
        List<Hotel> response = await homeRepository.getHotels();
        emit(HomeLoaded(response));

      } catch (e) {

        emit(HomeError(message:  e.toString()));
      }
    });
  }
}
import 'package:booking_app/data/model/room.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  ChoiceCubit()
       : super(ChoiceState());

  void updateRooms(List<Room> rooms,
    String hotelId
  ) => emit(state.copyWith(choices: rooms,hotelId: hotelId));

  void selectRoom(Room? room) {


    emit(state.copyWith(selectedValue: state.selectedValue == room ? null : room));

  }
}

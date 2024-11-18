import 'package:booking_app/data/model/room.dart';
import 'package:booking_app/repository/detail_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  ChoiceCubit() : super(ChoiceState());

  void updateRooms(List<Room> rooms) => emit(state.copyWith(choices: rooms));

  void selectRoom(Room? room) {
    emit(state.copyWith(selectedValue: room));
  }
}

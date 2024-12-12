import 'package:booking_app/bloc/date_picker/date_picker_cubit.dart';
import 'package:booking_app/data/model/room.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choice_state.dart';

class ChoiceCubit extends Cubit<ChoiceState> {
  final DatePickerCubit datePickerCubit;
  ChoiceCubit(this.datePickerCubit)
       : super(ChoiceState());

  void updateRooms(List<Room> rooms,
    String hotelId
  ) => emit(state.copyWith(choices: rooms,hotelId: hotelId));

  void selectRoom(Room? room) {

    emit(state.copyWith(selectedValue: state.selectedValue == room ? null : room));
    if (state.selectedValue ==null){
      datePickerCubit.hideDatePicker();
    }else {
      datePickerCubit.showDatePicker();
      datePickerCubit.updateBlackoutDates(room!.id);
    }


  }




}

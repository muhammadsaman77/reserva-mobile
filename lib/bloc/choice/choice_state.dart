part of 'choice_cubit.dart';

class ChoiceState extends Equatable {
  final Room? selectedValue;
  final List<Room> rooms;
  final String hotelId;

  const ChoiceState( {this.selectedValue, this.rooms = const [],this.hotelId=""});


  @override
  List<Object?> get props => [selectedValue, rooms];

  ChoiceState copyWith({Room? selectedValue,bool? isLoading, List<Room>? choices, String? hotelId}) =>
      ChoiceState(
          selectedValue: selectedValue,
          rooms: choices ?? rooms,
          hotelId: hotelId ?? this.hotelId
      );
}

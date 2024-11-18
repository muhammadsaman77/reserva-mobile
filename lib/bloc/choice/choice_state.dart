part of 'choice_cubit.dart';

class ChoiceState extends Equatable {
  final Room? selectedValue;
  final List<Room> rooms;

  ChoiceState( {this.selectedValue, this.rooms = const []});


  @override
  List<Object?> get props => [selectedValue, rooms];

  ChoiceState copyWith({Room? selectedValue,bool? isLoading, List<Room>? choices}) =>
      ChoiceState(
          selectedValue: selectedValue ?? this.selectedValue,
          rooms: choices ?? this.rooms);
}

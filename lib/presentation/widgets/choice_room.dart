import 'package:booking_app/data/model/room.dart';
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';

class ChoiceRoom extends StatelessWidget {
  final List<Room> choices;

  final Room? selectedValue;
  final void Function(Room?) setSelectedValue;

  const ChoiceRoom({super.key, required this.choices, required this.selectedValue, required this.setSelectedValue});

  @override
  Widget build(BuildContext context) {
    return InlineChoice<Room>.single(

      clearable: true,
      value: selectedValue,
      onChanged: setSelectedValue,
      itemCount: choices.length,
      itemBuilder: (state, i) {
        return ChoiceChip(

          selected: state.selected(choices[i]),
          onSelected: state.onSelected(choices[i]),
          label: Text(choices[i].name),
        );
      },
      listBuilder: ChoiceList.createWrapped(
        spacing: 5,
        runSpacing: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
      ),
    );
  }
}

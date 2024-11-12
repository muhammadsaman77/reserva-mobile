import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';
part 'bottom_navigation_event.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState.initial()) {
    on<ChangeBottomNav>((event, emit) {
      switch (event.navbarItem) {
        case NavbarItems.home:
          emit(const BottomNavigationState(navbarItem: NavbarItems.home , index: 0));
          break;
        case NavbarItems.schedule:
          emit(const BottomNavigationState(navbarItem: NavbarItems.schedule , index: 1));
          break;
        case NavbarItems.profile:
          emit(const BottomNavigationState(navbarItem: NavbarItems.profile , index: 2));
          break;
      }
    });
  }
}
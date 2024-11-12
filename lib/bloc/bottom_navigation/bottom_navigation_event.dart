part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangeBottomNav extends BottomNavigationEvent {
  final NavbarItems navbarItem;

  const ChangeBottomNav(this.navbarItem);

  @override
  List<Object> get props => [navbarItem];
}

part of 'bottom_navigation_bloc.dart';

enum NavbarItems { home, schedule, profile }


class BottomNavigationState extends Equatable{
  final NavbarItems navbarItem;
  final int index;

  const BottomNavigationState({required this.navbarItem, required this.index});

  @override
  List<Object> get props => [navbarItem, index];

  static BottomNavigationState initial() {
    return const BottomNavigationState(
      navbarItem: NavbarItems.home,
      index: 0,
    );
  }
}
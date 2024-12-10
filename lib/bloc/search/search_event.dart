part of 'search_bloc.dart';

abstract class SearchEvent {}

class ToggleSearchEvent extends SearchEvent {}
class FetchSearchResults extends SearchEvent {
  final String query;
  FetchSearchResults(this.query);
}

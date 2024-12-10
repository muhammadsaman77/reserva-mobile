import 'package:booking_app/data/model/hotel.dart';
import 'package:booking_app/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  bool isSearching = false;
  final HomeRepository homeRepository = HomeRepository();

  SearchBloc() : super(SearchInitial()) {
    on<ToggleSearchEvent>((event, emit) {
      isSearching = !isSearching;
      emit(SearchInitial());
    });
    on<FetchSearchResults>((event, emit) async {
      emit(SearchLoading());
      try {
        List<Hotel> response = await homeRepository.getHotels(query: event.query);
        print(response);
        emit(SearchLoaded(response));

      } catch (e) {
        print(e);
        emit(SearchError(e.toString()));
      }
    });
  }
}

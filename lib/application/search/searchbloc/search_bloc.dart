import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloads _downloadsService;
  final SearchService _seacrchService;
  SearchBloc(this._downloadsService, this._seacrchService)
      : super(SearchState.initial()) {
    /*
    idle state
    */
    on<initialize>((event, emit) async {
      if (state.idleList.isEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: true,
            isError: false));
      }
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result = await _downloadsService.getDownloadsImage();
      final _state = _result.fold((MainFailure) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });

      emit(_state);
    });
    /* 
     search result state
     */
    on<searchMovie>((event, emit) async {
      emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: true,
          isError: false));
      final _result =
          await _seacrchService.SearcMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (SearchResponse r) {
          return SearchState(
              searchResultList: r.results,
              idleList: [],
              isLoading: false,
              isError: false);
        },
      );
      emit(_state);
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_clone/domain/core/failure/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_service.dart';

import '../../../domain/hot_and_new/model/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
 final HotNewService _homeService;
 final uuTime = DateTime.now().millisecondsSinceEpoch.toString();
  HomeBloc(this._homeService) : super(HomeState.initial()){


    on<GetHomeScreenData>((event, emit)async {

    emit(state.copyWith(isLoading: true,isError: false));

     final _movieResult = await _homeService.getHotAndMovieData();
     final _tvResult = await _homeService.getHotAndTvData();


     final state1 =  _movieResult.fold(
      (MainFailure failure) {
         HomeState(
          stateId: uuTime,
          pastYearMovieList: [], 
          trendingMovieList: [],
           tenseDramasMovieList: [],
            southIndianMovieList: [], 
            trendingTvList: [],
             isLoading: false, 
             isError: true
             );


      },
     (HotAndNew resp) {
      final pastYear = resp.results;
      final trending = resp.results;
      final dramas = resp.results;
      final southIndian = resp.results;
      pastYear!.shuffle();
      trending!.shuffle();
      dramas!.shuffle();
      southIndian!.shuffle();

      return HomeState(
         stateId: uuTime,
          pastYearMovieList: pastYear, 
          trendingMovieList: trending,
           tenseDramasMovieList: dramas,
            southIndianMovieList: southIndian, 
            trendingTvList: state.trendingTvList,
             isLoading: false, 
             isError: false
             );

     });

     emit(state1!);

    final state2=_tvResult!.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: uuTime,
          pastYearMovieList: [], 
          trendingMovieList: [],
           tenseDramasMovieList: [],
            southIndianMovieList: [], 
            trendingTvList: [],
             isLoading: false, 
             isError: true
             );

      },
     (HotAndNew resp) {
      final top10List = resp.results;
      return HomeState(
        stateId: uuTime,
          pastYearMovieList:state.pastYearMovieList, 
           trendingMovieList: top10List,
           tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList, 
            trendingTvList: state.trendingTvList,
             isLoading: false, 
             isError: false
             );

     });
     emit(state2);

    });
  }
}

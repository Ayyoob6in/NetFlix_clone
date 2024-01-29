import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failure/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_service.dart';

import '../../../domain/hot_and_new/model/hot_and_new.dart';

part 'hotand_new_bloc_event.dart';
part 'hotand_new_bloc_state.dart';
part 'hotand_new_bloc_bloc.freezed.dart';

@injectable 
class HotandNewBlocBloc extends Bloc<HotandNewBlocEvent, HotandNewBlocState> {
  final HotNewService _hotAndNewService;
  HotandNewBlocBloc(this._hotAndNewService) : super(HotandNewBlocState.initial()) {
  
  
    on<LoadDataInComingSoon>((event, emit)async{
      emit(const HotandNewBlocState(
        comingSoonList: [],
         everyoneWatchingList: [], 
         isLoading: true,
          isError: false
          ));

       final _result = await _hotAndNewService.getHotAndMovieData();
      final newState =  _result.fold((MainFailure failure){
        return const HotandNewBlocState(
          comingSoonList: [],
           everyoneWatchingList: [],
            isLoading: false, 
            isError: false
            );
       }, 
       (HotAndNew res) 
       {
        return HotandNewBlocState(
          comingSoonList: res.results,
          everyoneWatchingList: state.everyoneWatchingList,
          isLoading: false,
          isError: false
             );
       });
       emit(newState);

    });

     on<LoadDataInEveryOneWatching>((event, emit)async{
       emit(const HotandNewBlocState(
        comingSoonList: [],
         everyoneWatchingList: [], 
         isLoading: true,
          isError: false
          ));

       final _result = await _hotAndNewService.getHotAndTvData();
      final newState =  _result!.fold((MainFailure failure){
        return const HotandNewBlocState(
          comingSoonList: [],
           everyoneWatchingList: [],
            isLoading: false, 
            isError: false
            );
       }, 
       (HotAndNew res) 
       {
        return HotandNewBlocState(
          comingSoonList: state.comingSoonList,
          everyoneWatchingList: res.results,
          isLoading: false,
          isError: false
             );
       });
       emit(newState);
    });
  }
}

part of 'hotand_new_bloc_bloc.dart';

@freezed
class HotandNewBlocState with _$HotandNewBlocState {
  const factory HotandNewBlocState({
    required List<HotAndNewData>?comingSoonList,
    required List<HotAndNewData>?everyoneWatchingList,
    required bool isLoading,
    required bool isError,

  }) = _Initial;

  factory HotandNewBlocState.initial()=> const HotandNewBlocState(
    comingSoonList: [],
     everyoneWatchingList: [],
      isLoading: false,
       isError: false
       );
}

part of 'hotand_new_bloc_bloc.dart';

@freezed
class HotandNewBlocEvent with _$HotandNewBlocEvent {
  const factory HotandNewBlocEvent.loadDataInComingSoon() = LoadDataInComingSoon;
  const factory HotandNewBlocEvent.loadDataInEveryOneWatching() = LoadDataInEveryOneWatching;
}
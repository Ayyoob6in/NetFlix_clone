part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState(
      {required List<Downloads> videosLoist,
      //required List<int>likedVediosId,
      required bool isLoading,
      required bool isError}) = _Initial;

  factory FastLaughState.initial() => const FastLaughState(
      videosLoist: [],
      //likedVediosId: [],
      isLoading: true,
      isError: false);
}

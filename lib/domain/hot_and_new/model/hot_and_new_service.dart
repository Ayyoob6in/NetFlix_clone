import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failure/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new.dart';

abstract class HotNewService {
  Future<Either<MainFailure, HotAndNew>> getHotAndMovieData();
  Future<Either<MainFailure, HotAndNew>>? getHotAndTvData();
}
 
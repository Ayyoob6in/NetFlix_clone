import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failure/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_service.dart';

@LazySingleton(as: HotNewService)
class HotAndNewImplimentation implements HotNewService {
  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}

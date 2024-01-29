import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/core/failure/main_failure.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_response.dart';
import 'package:netflix_clone/domain/search/model/search_response/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImpli implements SearchService {
  @override
  Future<Either<MainFailure, SearchResponse>> SearcMovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {'query': movieQuery},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
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

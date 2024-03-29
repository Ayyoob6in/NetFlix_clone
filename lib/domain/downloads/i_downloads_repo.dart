import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failure/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloads {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage();
}

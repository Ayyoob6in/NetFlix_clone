import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  //defining this
  /*
  https://api.themoviedb.org/3/trending/all/day?api_key=fdbe4ade7f24d74a8da159522bb47283
  its divided into 3
  */
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";
  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewTv = '$kBaseUrl/discover/tv?api_key=$apiKey';
}

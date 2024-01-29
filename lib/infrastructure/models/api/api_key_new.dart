import 'dart:convert';

import 'package:netflix_clone/infrastructure/models/api/api.dart';
import 'package:netflix_clone/infrastructure/models/movies/movies.dart';
import "package:http/http.dart" as http;

class ApiKeyNew {
  static const _trendingURl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${ConstApi.newApiKey}";

  Future<List<Movie>> gettrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingURl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)["results"] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromjson(movie)).toList();
    } else {
      throw Exception("SomeThing happened");
    }
  }
}

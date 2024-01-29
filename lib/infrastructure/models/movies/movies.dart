class Movie {
  String? title;
  String backDropPath;
  String? orginalTitle;
  String? overView;
  String? posterPath;
  String? releaseDate;
  double? voteAvarage;

  Movie(
      {required this.title,
      required this.backDropPath,
      required this.orginalTitle,
      required this.overView,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAvarage});

  factory Movie.fromjson(Map<String, dynamic> json) {
    return Movie(
      backDropPath: json["backdrop_path"] ?? "Some Titile",
      orginalTitle: json["original_title"] ?? "orginal title",
      overView: json["overview"] ?? "overView",
      posterPath: json["poster_path"] ?? "poster path",
      releaseDate: json["release_date"] ?? "release Data",
      title: json["title"] ?? "title",
      voteAvarage: json["vote_average"] ?? "v2.5",
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "backdrop_path": backDropPath,
        "original_title": orginalTitle,
        "overview": overView,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "vote_average": voteAvarage
      };
}

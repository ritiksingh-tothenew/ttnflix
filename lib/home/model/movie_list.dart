import 'package:json_annotation/json_annotation.dart';

part 'movie_list.g.dart';

@JsonSerializable(createToJson: false)
class MovieListModel {
  int? page;
  @JsonKey(name: "results")
  List<Movie>? movieList;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  MovieListModel(this.page, this.movieList, this.totalPages, this.totalResults);

  factory MovieListModel.fromJson(Map<String, dynamic> data) =>
      _$MovieListModelFromJson(data);
}

@JsonSerializable(createToJson: false)
class Movie {
  String? title;
  String? overview;

  Movie(this.title, this.overview);

  factory Movie.fromJson(Map<String, dynamic> data) => _$MovieFromJson(data);
}

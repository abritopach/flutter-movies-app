import 'package:movies_app/data/models/movie.model.dart';

class MoviesApiResultModel {
  final List<MovieModel> movies;

  MoviesApiResultModel({this.page, this.movies});

  factory MoviesApiResultModel.fromJson(Map<String, dynamic> json) {
    List<MovieModel> tempMovies = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        tempMovies.add(MovieModel.fromJson(v));
      });
    }

    return MoviesApiResultModel(movies: tempMovies);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
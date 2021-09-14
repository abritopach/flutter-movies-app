import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:movies_app/data/core/api.constants.dart';
import 'package:movies_app/data/models/movie.model.dart';
import 'package:movies_app/data/models/movies_api_result.model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {

  final Client _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.TMDB_BASE_URL}trending/movie/day?api_key=${ApiConstants.TMDB_API_KEY}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final responseBody =  json.decode(response.body);
      final movies = MoviesApiResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.TMDB_BASE_URL}movie/popular?api_key=${ApiConstants.TMDB_API_KEY}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseBody =  json.decode(response.body);
      final movies = MoviesApiResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

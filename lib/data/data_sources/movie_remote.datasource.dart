import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:movies_app/data/core/api.client.dart';
import 'package:movies_app/data/core/api.constants.dart';
import 'package:movies_app/data/models/movie.model.dart';
import 'package:movies_app/data/models/movies_api_result.model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {

  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    print('MovieRemoteDataSourceImpl::getTranding response $response');
    return MoviesApiResultModel.fromJson(response).movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    print('MovieRemoteDataSourceImpl::getPopular response $response');
    return MoviesApiResultModel.fromJson(response).movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/popular');
    print('MovieRemoteDataSourceImpl::getPopular response $response');
    return MoviesApiResultModel.fromJson(response).movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/popular');
    print('MovieRemoteDataSourceImpl::getPopular response $response');
    return MoviesApiResultModel.fromJson(response).movies;
  }
}

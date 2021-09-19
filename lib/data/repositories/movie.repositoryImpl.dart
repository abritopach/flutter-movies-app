import 'package:movies_app/data/data_sources/movie_remote.datasource.dart';
import 'package:movies_app/data/models/movie.model.dart';
import 'package:movies_app/data/repositories/movie.repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return movies;
    } on Exception {
      return [];
    }
  }
}
import 'package:movies_app/domain/entities/movie.entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getTrending();
}

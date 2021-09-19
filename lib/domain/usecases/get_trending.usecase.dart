import 'package:movies_app/data/repositories/movie.repository.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';

class GetTrending {
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getTrending();
  }
}
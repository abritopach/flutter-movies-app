import 'package:dartz/dartz.dart';
import 'package:movies_app/data/core/app.error.dart';
import 'package:movies_app/data/repositories/movie.repository.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';

class GetPlayingNow {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call() async {
    return await repository.getPlayingNow();
  }
}
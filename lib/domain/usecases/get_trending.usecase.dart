import 'package:dartz/dartz.dart';
import 'package:movies_app/data/core/app.error.dart';
import 'package:movies_app/data/repositories/movie.repository.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';
import 'package:movies_app/domain/usecases/usecase.dart';
import 'package:movies_app/utils/noparams.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTrending();
  }
}
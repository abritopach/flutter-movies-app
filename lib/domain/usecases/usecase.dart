import 'package:dartz/dartz.dart';
import 'package:movies_app/data/core/app.error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

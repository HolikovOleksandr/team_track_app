import 'package:dartz/dartz.dart';
import 'package:team_track_app/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> execute(Params params);
}

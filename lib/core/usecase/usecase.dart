import 'package:dartz/dartz.dart';
import 'package:team_track_app/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> execute([Param param]);
}

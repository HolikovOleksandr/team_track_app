import 'package:dartz/dartz.dart';
import 'package:team_track_app/core/errors/failure.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List>> getAllEmployees();
}

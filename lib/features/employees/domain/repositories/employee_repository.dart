import 'package:dartz/dartz.dart';
import 'package:team_track_app/core/error/failure.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List>> getAllEmployees();
}

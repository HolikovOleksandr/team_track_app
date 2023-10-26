import 'package:dartz/dartz.dart';
import 'package:team_track_app/core/errors/failure.dart';
import 'package:team_track_app/features/employees/data/models/employee_model.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<EmployeeModel>>> getAllEmployees();
}

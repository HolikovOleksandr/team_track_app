import 'package:dartz/dartz.dart';
import 'package:team_track_app/features/employees/data/models/employee_model.dart';
import 'package:team_track_app/features/employees/domain/repositories/employee_repository.dart';
import 'package:team_track_app/core/errors/failure.dart';
import 'package:team_track_app/core/usecase/usecase.dart';
import '../../../../core/parameters/api_parameters.dart';

class GetAllEmployees extends UseCase<List<EmployeeModel>, Parameters> {
  final EmployeeRepository repository;

  GetAllEmployees({required this.repository});

  @override
  Future<Either<Failure, List<EmployeeModel>>> execute(Parameters params) {
    return repository.getAllEmployees();
  }
}

import 'package:dartz/dartz.dart';
import 'package:team_track_app/features/employees/data/models/employee_model.dart';
import 'package:team_track_app/features/employees/domain/repositories/employee_repository.dart';
import 'package:team_track_app/core/errors/failure.dart';
import 'package:team_track_app/core/usecase/usecase.dart';

class GetAllEmployees extends UseCase<List<EmployeeModel>, void> {
  final EmployeeRepository repository;

  GetAllEmployees({required this.repository});

  @override
  Future<Either<Failure, List<EmployeeModel>>> execute([void param]) {
    return repository.getAllEmployees();
  }
}

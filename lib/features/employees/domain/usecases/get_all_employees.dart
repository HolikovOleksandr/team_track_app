import 'package:dartz/dartz.dart';
import 'package:team_track_app/features/employees/domain/repositories/employee_repository.dart';
import 'package:team_track_app/core/error/failure.dart';
import 'package:team_track_app/core/usecase/usecase.dart';

class GetAllEmployees extends UseCase<List, void> {
  final EmployeeRepository repository;

  GetAllEmployees({required this.repository});

  @override
  Future<Either<Failure, List>> execute(void params) {
    return repository.getAllEmployees();
  }
}

import '../../models/employee_model.dart';

abstract class EmploeesRemoteDataSource {
  Future<List<EmployeeModel>> getAllEmployees();
}

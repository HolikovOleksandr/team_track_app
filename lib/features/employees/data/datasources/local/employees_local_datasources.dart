import '../../models/employee_model.dart';

abstract class EmployeeLocalDatasouce {
  Future<EmployeeModel> getLastEmployee();

  Future<void> cacheEmployees(List<EmployeeModel> employee);
}

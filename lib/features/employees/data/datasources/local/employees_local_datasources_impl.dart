// ignore_for_file: void_checks

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_track_app/core/constants/app_strings.dart';
import 'package:team_track_app/core/errors/exceptions.dart';
import 'package:team_track_app/features/employees/data/datasources/local/employees_local_datasources.dart';
import 'package:team_track_app/features/employees/data/models/employee_model.dart';

class EmployeeLocalDatasoucesImpl implements EmployeeLocalDatasouce {
  final SharedPreferences sharedPreferences;

  EmployeeLocalDatasoucesImpl({required this.sharedPreferences});

  @override
  Future<void> cacheEmployees(List<EmployeeModel> employees) {
    var employeeList = employees.map((e) => e.toMap()).toList();
    var data = json.encode(employeeList);

    return sharedPreferences.setString(AppStrings.cachedEmployees, data);
  }

  @override
  Future<EmployeeModel> getLastEmployee() {
    final data = sharedPreferences.getString(AppStrings.cachedEmployees);

    if (data != null) {
      //
      final employeesList =
          json.decode(data).map((e) => EmployeeModel.fromMap(e)).toList();

      return employeesList.isNotEmpty
          ? Future.value(employeesList.last)
          : throw CacheException();
      //
    } else {
      throw CacheException();
    }
  }
}

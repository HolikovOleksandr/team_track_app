import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_track_app/core/errors/failure.dart';
import 'package:team_track_app/core/network/network_info.dart';
import 'package:team_track_app/features/employees/data/datasources/local/employees_local_datasources_impl.dart';
import 'package:team_track_app/features/employees/data/datasources/remote/employees_remote_datasources_impl.dart';
import 'package:team_track_app/features/employees/data/models/employee_model.dart';
import 'package:team_track_app/features/employees/data/repositories/employees_repository_impl.dart';
import 'package:http/http.dart' as http;
import 'package:team_track_app/features/employees/domain/usecases/get_all_employees.dart';

class EmployeesProvider extends ChangeNotifier {
  List<EmployeeModel>? employees;
  Failure? failure;

  EmployeesProvider({this.employees, this.failure});

  void eitherFailureOrEmployees() async {
    //
    EmployeeRepositoryImpl repository = EmployeeRepositoryImpl(
      localDatasouce: EmployeeLocalDatasoucesImpl(
          sharedPreferences: await SharedPreferences.getInstance()),
      remoteDataSource: EmploeesRemoteDataSourcesImpl(client: http.Client()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrEmployees =
        await GetAllEmployees(repository: repository).execute();

    failureOrEmployees.fold(
      (fail) {
        employees = null;
        failure = fail;
      },
      (succes) {
        employees = succes;
        failure = null;
      },
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:team_track_app/core/errors/exceptions.dart';
import 'package:team_track_app/features/employees/data/datasources/remote/employees_remote_datasources.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/constants/app_strings.dart';
import '../../models/employee_model.dart';

class EmploeesRemoteDataSourcesImpl implements EmploeesRemoteDataSource {
  final http.Client client;

  EmploeesRemoteDataSourcesImpl({required this.client});

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    final url = Uri.parse(AppStrings.getAll);
    // final endpoint = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await client.get(url);

    if (response.statusCode == HttpStatus.ok) {
      debugPrint('=====>>>>>> BODY: ${response.body}');
      final List<dynamic> data = json.decode(response.body);
      final List<EmployeeModel> employeeList = [];

      for (var item in data) {
        final employee = EmployeeModel.fromMap(item);
        employeeList.add(employee);
      }

      return employeeList;
    } else {
      return throw ServerException();
    }
  }
}

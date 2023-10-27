import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:team_track_app/core/errors/exceptions.dart';
import 'package:team_track_app/features/employees/data/datasources/remote/employees_remote_datasources.dart';
import 'package:http/http.dart' as http;
import 'package:team_track_app/features/employees/domain/entities/api_response.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../models/employee_model.dart';

class EmploeesRemoteDataSourcesImpl implements EmploeesRemoteDataSource {
  final http.Client client;

  EmploeesRemoteDataSourcesImpl({required this.client});

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    final url = Uri.parse(AppStrings.getAll);
    final response = await client.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final data = json.decode(response.body);

      final apiResponse = ApiResponse.fromMap(data);
      debugPrint('=====>>>>>> Api Response: ${apiResponse.toString()}');

      final List<EmployeeModel> employees = [];

      for (var item in apiResponse.data) {
        final employee = EmployeeModel.fromMap(item);
        employees.add(employee);
      }

      return employees;
    } else {
      return throw ServerException();
    }
  }
}

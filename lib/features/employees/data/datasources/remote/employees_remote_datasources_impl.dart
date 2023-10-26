import 'dart:convert';
import 'dart:io';
import 'package:team_track_app/core/constants/app_strings.dart';
import 'package:team_track_app/core/errors/exceptions.dart';
import 'package:team_track_app/features/employees/data/datasources/remote/employees_remote_datasources.dart';
import 'package:http/http.dart' as http;
import '../../models/employee_model.dart';

class EmploeesRemoteDataSourcesImpl implements EmploeesRemoteDataSource {
  final http.Client client;

  EmploeesRemoteDataSourcesImpl({required this.client});

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    final endpoint = Uri.parse(AppStrings.getAll);
    final response = await client.get(endpoint, headers: AppStrings.apiHeaders);

    return response.statusCode == HttpStatus.ok
        ? json.decode(response.body)
        : throw ServerException();
  }
}

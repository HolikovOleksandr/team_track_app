import 'package:dartz/dartz.dart';
import 'package:team_track_app/core/errors/exceptions.dart';
import 'package:team_track_app/core/errors/failure.dart';
import 'package:team_track_app/features/employees/data/datasources/local/employees_local_datasources.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/employee_repository.dart';
import '../datasources/remote/employees_remote_datasources.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmploeesRemoteDataSource remoteDataSource;
  final EmployeeLocalDatasouce localDatasouce;
  final NetworkInfo networkInfo;

  EmployeeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDatasouce,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List>> getAllEmployees() async {
    if (await networkInfo.isConnected) {
      try {
        //
        final employeesList = await remoteDataSource.getAllEmployees();
        localDatasouce.cacheEmployees(employeesList);
        return Right(employeesList);
        //
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        //
        final lastEmployee = await localDatasouce.getLastEmployee();
        final employeeList = [lastEmployee];
        return Right(employeeList);
        //
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

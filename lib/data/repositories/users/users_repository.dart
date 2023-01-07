import 'package:dartz/dartz.dart';
import 'package:shopack_admin/data/datasources/users/users_datasource.dart';
import 'package:shopack_admin/data/models/response_model.dart';
import 'package:shopack_admin/data/models/users_model.dart';
import '../../../core/error/failure.dart';
import '../../../core/helper/remote/network_info.dart';
import '../../../core/utilities/params.dart';

abstract class UsersRepository {
  late NetworkInfo networkInfo;
  late UsersDatasource usersDatasource;

  Future<Either<Failure, UsersModel>> getAllUsers(NoParams params);
  Future<Either<Failure, ResponseModel>> updateRole(UpdateRoleParams params);
    Future<Either<Failure, ResponseModel>> deleteUser(DeletUserParams params);
}

import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/core/utilities/params.dart';
import 'package:shopack_admin/data/datasources/users/users_datasource.dart';
import 'package:shopack_admin/data/models/response_model.dart';
import 'package:shopack_admin/data/models/users_model.dart';
import 'package:shopack_admin/data/repositories/users/users_repository.dart';
import '../../../core/error/error_handler.dart';
import '../../../core/utilities/strings.dart';

class UsersRepositoryImpl implements UsersRepository {
  @override
  NetworkInfo networkInfo;

  @override
  UsersDatasource usersDatasource;
  UsersRepositoryImpl({
    required this.networkInfo,
    required this.usersDatasource,
  });

  @override
  Future<Either<Failure, UsersModel>> getAllUsers(NoParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await usersDatasource.getAllUsers(params);
        return right(UsersModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> updateRole(
      UpdateRoleParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await usersDatasource
            .updateRole(UpdateRoleParams(params.id, params.role));
        return right(ResponseModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> deleteUser(
      DeletUserParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data =
            await usersDatasource.deleteUser(DeletUserParams(params.id));
        return right(ResponseModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
}

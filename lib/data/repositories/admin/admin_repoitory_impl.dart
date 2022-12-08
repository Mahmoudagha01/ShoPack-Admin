import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/error_handler.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/core/utilities/strings.dart';
import 'package:shopack_admin/data/datasources/admin/admin_datasource.dart';
import 'package:shopack_admin/data/models/login_model.dart';
import 'package:shopack_admin/data/repositories/admin/admin_repository.dart';

class AdminRepositoryImpl implements AdminRepository {
  @override
  NetworkInfo networkInfo;
  @override
  AdminDatasource adminDatasouece;
  AdminRepositoryImpl(
      {required this.networkInfo, required this.adminDatasouece});
  @override
  Future<Either<Failure, LoginModel>> login(LoginParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await adminDatasouece.login(params);
        return right(LoginModel.fromJson(data));
      } catch (error) {
        print(error);
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
}

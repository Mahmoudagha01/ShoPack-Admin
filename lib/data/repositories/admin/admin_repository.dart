import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/data/datasources/admin/admin_datasource.dart';
import 'package:shopack_admin/data/models/login_model.dart';
import '../../../core/utilities/params.dart';

abstract class AdminRepository {
  late NetworkInfo networkInfo;
  late AdminDatasource adminDatasouece;

  Future<Either<Failure, LoginModel>> login(LoginParams params);
}


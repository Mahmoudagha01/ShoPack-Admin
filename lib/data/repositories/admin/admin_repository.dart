// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/data/datasources/admin/admin_datasource.dart';
import 'package:shopack_admin/data/models/login_model.dart';

abstract class AdminRepository {
  late NetworkInfo networkInfo;
  late AdminDatasource adminDatasouece;

  Future<Either<Failure, LoginModel>> login(LoginParams params);
}


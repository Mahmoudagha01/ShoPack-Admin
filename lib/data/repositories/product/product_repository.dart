import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/data/datasources/product/product_datasource.dart';
import 'package:shopack_admin/data/models/product_model.dart';

abstract class ProductRepository {
  late NetworkInfo networkInfo;
  late ProductDataSource productDataSource;

  Future<Either<Failure,ProductsModel>> addProduct(AddProductParams params);
}

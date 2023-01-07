import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/data/datasources/product/product_datasource.dart';
import 'package:shopack_admin/data/models/product_model.dart';
import 'package:shopack_admin/data/models/response_model.dart';
import 'package:shopack_admin/data/models/reviews_model.dart';
import '../../../core/utilities/params.dart';
import '../../models/all_product_model.dart';

abstract class ProductRepository {
  late NetworkInfo networkInfo;
  late ProductDataSource productDataSource;

  Future<Either<Failure, ProductsModel>> addProduct(AddProductParams params);
  Future<Either<Failure, AllProductsModel>> getAllProducts(NoParams params);
  Future<Either<Failure, ProductsModel>> editProduct(EditProductParams params);
  Future<Either<Failure, ResponseModel>> deleteProduct(
      DeleteProductParams params);
        Future<Either<Failure, ReviewsModel>> getReviews(GetReviewsParams params);
         Future<Either<Failure, ResponseModel>> deleteReview(DeleteReviewsParams params);
}


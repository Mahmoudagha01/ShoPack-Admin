import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/error_handler.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/core/utilities/strings.dart';
import 'package:shopack_admin/data/datasources/product/product_datasource.dart';
import 'package:shopack_admin/data/models/all_product_model.dart';
import 'package:shopack_admin/data/models/product_model.dart';
import 'package:shopack_admin/data/models/response_model.dart';
import 'package:shopack_admin/data/models/reviews_model.dart';
import 'package:shopack_admin/data/repositories/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  NetworkInfo networkInfo;

  @override
  ProductDataSource productDataSource;
  ProductRepositoryImpl({
    required this.networkInfo,
    required this.productDataSource,
  });

  @override
  Future<Either<Failure, ProductsModel>> addProduct(
      AddProductParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productDataSource.addProduct(params);
        return right(ProductsModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, AllProductsModel>> getAllProducts(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productDataSource.getAllProducts(params);
        return right(AllProductsModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ProductsModel>> editProduct(
      EditProductParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productDataSource.editProduct(params);
        return right(ProductsModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> deleteProduct(
      DeleteProductParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productDataSource.deletProduct(params);
        return right(ResponseModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ReviewsModel>> getReviews(GetReviewsParams params) async{
    if (await networkInfo.isConnected) {
      try {
        final data = await productDataSource.getReviews(params);
        return right(ReviewsModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
  
  @override
  Future<Either<Failure, ResponseModel>> deleteReview(DeleteReviewsParams params) async{
    if (await networkInfo.isConnected) {
      try {
        final data = await productDataSource.deleteReview(params);
        return right(ResponseModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
}

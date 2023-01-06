import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/data/datasources/product/product_datasource.dart';
import 'package:shopack_admin/data/models/product_model.dart';
import 'package:shopack_admin/data/models/response_model.dart';
import 'package:shopack_admin/data/models/reviews_model.dart';
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

class NoParams {}

class AddProductParams {
  final String name;
  final String price;
  final String category;
  final String description;
  final String stock;
  final List images;

  AddProductParams(this.name, this.price, this.category, this.description,
      this.stock, this.images);
}

class EditProductParams {
  final String name;
  final String price;
  final String category;
  final String description;
  final String stock;
  final List images;
  final String id;
  EditProductParams(this.name, this.price, this.category, this.description,
      this.stock, this.images, this.id);
}

class DeleteProductParams {
  final String id;

  DeleteProductParams(this.id);
}

class GetReviewsParams {
  final String id;

  GetReviewsParams(this.id);
}

class DeleteReviewsParams {
  final String productId;
  final String reviewId;

  DeleteReviewsParams(this.productId, this.reviewId);
}
import 'package:shopack_admin/core/helper/remote/network_provider.dart';
import 'package:shopack_admin/core/utilities/endpoints.dart';
import '../../../core/utilities/params.dart';

abstract class ProductDataSource {
  late APIProvider apiProvider;
  Future<Map<String, dynamic>> addProduct(AddProductParams params);
  Future<Map<String, dynamic>> getAllProducts(NoParams params);
  Future<Map<String, dynamic>> editProduct(EditProductParams params);
  Future<Map<String, dynamic>> deletProduct(DeleteProductParams params);
  Future<Map<String, dynamic>> getReviews(GetReviewsParams params);
  Future<Map<String, dynamic>> deleteReview(DeleteReviewsParams params);
}

class ProductDataSourceImpl implements ProductDataSource {
  @override
  APIProvider apiProvider;
  ProductDataSourceImpl({
    required this.apiProvider,
  });

  @override
  Future<Map<String, dynamic>> addProduct(AddProductParams params) async {
    final response = await apiProvider
        .post(endPoint: addProductEndPoint, token: token ?? '', data: {
      "name": params.name,
      "description": params.description,
      "price": params.price,
      "stock": params.stock,
      "category": params.category,
      "images": params.images,
    });
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getAllProducts(NoParams params) async {
    final response = await apiProvider.get(endPoint: productsEndPoint);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> editProduct(EditProductParams params) async {
    final response = await apiProvider.put(
        endPoint: '$editProductEndPoint${params.id}',
        data: {
          "name": params.name,
          "description": params.description,
          "price": params.price,
          "stock": params.stock,
          "category": params.category,
          "images": params.images,
        },
        token: token ?? '');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> deletProduct(DeleteProductParams params) async {
    final response = await apiProvider.delete(
        endPoint: '$deleteProductEndPoint${params.id}', token: token ?? '');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getReviews(GetReviewsParams params) async {
    final response = await apiProvider
        .get(endPoint: getAllReviewsEndPoint, query: {'id': params.id});
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> deleteReview(DeleteReviewsParams params) async {
    final response = await apiProvider.delete(
        endPoint: deleteReviewsEndPoint,
        query: {'productId': params.productId, 'id': params.reviewId}, token: token ?? '');
    return response.data;
  }
}

import 'package:shopack_admin/core/helper/remote/network_provider.dart';
import 'package:shopack_admin/core/utilities/endpoints.dart';
import '../../repositories/product/product_repository.dart';

abstract class ProductDataSource {
  late APIProvider apiProvider;
  Future<Map<String, dynamic>> addProduct(AddProductParams params);
  Future<Map<String, dynamic>> getAllProducts(NoParams params);
  Future<Map<String, dynamic>> editProduct(EditProductParams params);
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
      token: token??''
    );
    return response.data;
  }
}

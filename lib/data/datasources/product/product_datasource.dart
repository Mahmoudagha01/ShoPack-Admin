
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/core/helper/remote/network_provider.dart';
import 'package:shopack_admin/core/utilities/endpoints.dart';
import 'package:shopack_admin/data/models/product_model.dart';

import '../../../business_logic/products/products_bloc.dart';
import '../../../core/helper/local/shared_preference.dart';

abstract class ProductDataSource {
  late APIProvider apiProvider;
  Future<Map<String, dynamic>> addProduct(AddProductParams params);
}

class ProductDataSourceImpl implements ProductDataSource {
  @override
  APIProvider apiProvider;
  ProductDataSourceImpl({
    required this.apiProvider,
  });

  @override
  Future<Map<String, dynamic>> addProduct(AddProductParams params) async {
    final response =
        await apiProvider.post(endPoint: addProductEndPoint,token: PreferenceHelper.getDataFromSharedPreference(key: "token"), data:{
      "name": params.name,
      "description": params.description,
      "price": params.price,
      "stock": params.price,
      "category": params.category,
      "images":params.images,
    });
    return response.data;
  }
}

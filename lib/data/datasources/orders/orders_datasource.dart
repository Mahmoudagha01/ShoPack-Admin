import 'package:shopack_admin/core/utilities/endpoints.dart';
import '../../../core/helper/remote/network_provider.dart';
import '../../../core/utilities/params.dart';

abstract class OrdersDataSource {
  late APIProvider apiProvider;
  Future<Map<String, dynamic>> getOrders(NoParams params);
  Future<Map<String, dynamic>> updateOrder(UpdateOrderParams params);
   Future<Map<String, dynamic>> deleteOrder(UpdateOrderParams params);
}

class OrdersDataSourceImpl implements OrdersDataSource {
  @override
  APIProvider apiProvider;
  OrdersDataSourceImpl({
    required this.apiProvider,
  });

  @override
  Future<Map<String, dynamic>> getOrders(NoParams params) async {
    final response = await apiProvider.get(
        endPoint: getAllOrdersEndPoint, token: token ?? '');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> updateOrder(UpdateOrderParams params) async {
    final reponse = await apiProvider.put(
        endPoint: '$orderEndPoint${params.id}', data: {"status": "Delivered"},token: token??'');
    return reponse.data;
  }
  
  @override
  Future<Map<String, dynamic>> deleteOrder(UpdateOrderParams params) async{
 final reponse = await apiProvider.delete(
        endPoint: '$orderEndPoint${params.id}',token: token??'');
    return reponse.data;
  }
}

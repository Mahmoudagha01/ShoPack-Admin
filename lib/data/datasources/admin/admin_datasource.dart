import 'package:shopack_admin/data/repositories/admin/admin_repository.dart';
import '../../../core/helper/remote/network_provider.dart';
import '../../../core/utilities/endpoints.dart';

abstract class AdminDatasource {
  late APIProvider apiProvider;
  Future<Map<String, dynamic>> login(LoginParams params);
}

class AdminDataSourceImpl implements AdminDatasource {
  @override
  APIProvider apiProvider;
  AdminDataSourceImpl({
    required this.apiProvider,
  });
  @override
  Future<Map<String, dynamic>> login(LoginParams params) async {
    final response = await apiProvider.post(endPoint: loginEndPoint, data: {
      "email":params.email,
      "password":params.password,
      "role": "admin"
    });
    
    return response.data;
  }
}

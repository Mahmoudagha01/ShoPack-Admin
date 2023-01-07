import 'package:shopack_admin/core/utilities/endpoints.dart';

import '../../../core/helper/remote/network_provider.dart';
import '../../../core/utilities/params.dart';

abstract class UsersDatasource {
  late APIProvider apiProvider;
  Future<Map<String, dynamic>> getAllUsers(NoParams params);
  Future<Map<String, dynamic>> updateRole(UpdateRoleParams params);
}

class UserDatasourceImpl implements UsersDatasource {
  @override
  APIProvider apiProvider;
  UserDatasourceImpl({
    required this.apiProvider,
  });

  @override
  Future<Map<String, dynamic>> getAllUsers(NoParams params) async {
    final response = await apiProvider.get(
        endPoint: getAllUsersEndPoint, token: token ?? '');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> updateRole(UpdateRoleParams params) async {
    final response = await apiProvider.put(
        endPoint: '$getSingleUserEndPoint${params.id}',
        data: {"role": params.role},
        token: token ?? "");
    return response.data;
  }
}

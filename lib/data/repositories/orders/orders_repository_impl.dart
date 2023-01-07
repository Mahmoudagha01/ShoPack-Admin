import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/error/failure.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/core/utilities/params.dart';
import 'package:shopack_admin/data/datasources/orders/orders_datasource.dart';
import 'package:shopack_admin/data/models/all_orders_model.dart';
import 'package:shopack_admin/data/models/response_model.dart';
import 'package:shopack_admin/data/repositories/orders/orders_repository.dart';
import '../../../core/error/error_handler.dart';
import '../../../core/utilities/strings.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  NetworkInfo networkInfo;

  @override
  OrdersDataSource ordersDataSource;
  OrdersRepositoryImpl({
    required this.networkInfo,
    required this.ordersDataSource,
  });

  @override
  Future<Either<Failure, AllOrdersModel>> getAllOrders(NoParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await ordersDataSource.getOrders(params);
        return right(AllOrdersModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> updateOrder(UpdateOrderParams params) async {
   if (await networkInfo.isConnected) {
      try {
        final data = await ordersDataSource.updateOrder(params);
        return right(ResponseModel.fromJson(data));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
}

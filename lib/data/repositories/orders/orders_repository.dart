import 'package:dartz/dartz.dart';
import 'package:shopack_admin/core/utilities/params.dart';
import 'package:shopack_admin/data/datasources/orders/orders_datasource.dart';
import 'package:shopack_admin/data/models/response_model.dart';
import '../../../core/error/failure.dart';
import '../../../core/helper/remote/network_info.dart';
import '../../models/all_orders_model.dart';

abstract class OrdersRepository{
   late NetworkInfo networkInfo;
  late OrdersDataSource ordersDataSource;

  Future<Either<Failure, AllOrdersModel>> getAllOrders(NoParams params);
  Future<Either<Failure, ResponseModel>> updateOrder(UpdateOrderParams params);
}

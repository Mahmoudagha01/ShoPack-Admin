import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopack_admin/business_logic/Admin/login_bloc.dart';
import 'package:shopack_admin/business_logic/BNB/BottomNavigationBar_bloc.dart';
import 'package:shopack_admin/business_logic/products/products_bloc.dart';
import 'package:shopack_admin/business_logic/users/user_bloc.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/core/helper/remote/network_provider.dart';
import 'package:shopack_admin/data/datasources/admin/admin_datasource.dart';
import 'package:shopack_admin/data/datasources/product/product_datasource.dart';
import 'package:shopack_admin/data/datasources/users/users_datasource.dart';
import 'package:shopack_admin/data/repositories/admin/admin_repoitory_impl.dart';
import 'package:shopack_admin/data/repositories/admin/admin_repository.dart';
import 'package:shopack_admin/data/repositories/orders/orders_repository.dart';
import 'package:shopack_admin/data/repositories/orders/orders_repository_impl.dart';
import 'package:shopack_admin/data/repositories/product/product_repository.dart';
import 'package:shopack_admin/data/repositories/product/products_repository_impl.dart';

import 'business_logic/orders/orders_bloc.dart';
import 'data/datasources/orders/orders_datasource.dart';
import 'data/repositories/users/users_repository.dart';
import 'data/repositories/users/users_repository_impl.dart';

GetIt injector = GetIt.instance;

Future<void> init() async {
//BloC
  injector.registerFactory(() => LoginBloc(injector()));
  injector.registerFactory(() => BottomNavigationBarBloc());
  injector.registerFactory(() => ProductsBloc(injector()));
  injector.registerFactory(() => OrdersBloc(injector()));
  injector.registerFactory(() => UserBloc(injector()));
//Repository
  injector.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
      networkInfo: injector(), productDataSource: injector()));
  injector.registerLazySingleton<AdminRepository>(() => AdminRepositoryImpl(
      networkInfo: injector(), adminDatasouece: injector()));
  injector.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl(
      networkInfo: injector(), ordersDataSource: injector()));
  injector.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(
      networkInfo: injector(), usersDatasource: injector()));
//DataSource
  injector.registerLazySingleton<AdminDatasource>(
      () => AdminDataSourceImpl(apiProvider: injector()));
  injector.registerLazySingleton<ProductDataSource>(
      () => ProductDataSourceImpl(apiProvider: injector()));
  injector.registerLazySingleton<OrdersDataSource>(
      () => OrdersDataSourceImpl(apiProvider: injector()));
      injector.registerLazySingleton<UsersDatasource>(
      () => UserDatasourceImpl(apiProvider: injector()));
//Core

  injector
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));
  injector.registerLazySingleton(() => InternetConnectionChecker());
  injector.registerLazySingleton<APIProvider>(() => APIProviderImpl());
}

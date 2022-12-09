import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopack_admin/business_logic/Admin/login_bloc.dart';
import 'package:shopack_admin/business_logic/BNB/BottomNavigationBar_bloc.dart';
import 'package:shopack_admin/business_logic/products/products_bloc.dart';
import 'package:shopack_admin/core/helper/remote/network_info.dart';
import 'package:shopack_admin/core/helper/remote/network_provider.dart';
import 'package:shopack_admin/data/datasources/admin/admin_datasource.dart';
import 'package:shopack_admin/data/repositories/admin/admin_repoitory_impl.dart';
import 'package:shopack_admin/data/repositories/admin/admin_repository.dart';

GetIt injector = GetIt.instance;

Future<void> init() async {
//BloC
  injector.registerFactory(() => LoginBloc(injector()));
  injector.registerFactory(() => BottomNavigationBarBloc());
  injector.registerFactory(() => ProductsBloc());
//Repository
  injector.registerLazySingleton<AdminRepository>(() => AdminRepositoryImpl(
      networkInfo: injector(), adminDatasouece: injector()));
//DataSource
  injector.registerLazySingleton<AdminDatasource>(
      () => AdminDataSourceImpl(apiProvider: injector()));
//Core
  injector
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));
  injector.registerLazySingleton(() => InternetConnectionChecker());
  injector.registerLazySingleton<APIProvider>(() => APIProviderImpl());
}

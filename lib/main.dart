import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/business_logic/BNB/BottomNavigationBar_bloc.dart';
import 'package:shopack_admin/business_logic/products/products_bloc.dart';
import 'package:shopack_admin/business_logic/users/user_bloc.dart';
import 'package:shopack_admin/core/helper/local/shared_preference.dart';
import 'package:shopack_admin/dependency_injection.dart';
import 'business_logic/Admin/login_bloc.dart';
import 'business_logic/orders/orders_bloc.dart';
import 'core/utilities/router.dart';
import 'core/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHelper.init();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => injector<BottomNavigationBarBloc>(),
        ),
        BlocProvider(
          create: (context) => injector<ProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => injector<OrdersBloc>(),
        ),
        BlocProvider(
          create: (context) => injector<UserBloc>(),
        ),
      ],
      child: const MaterialApp(
        title: 'ShoPack Admin',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.login,
      ),
    );
  }
}

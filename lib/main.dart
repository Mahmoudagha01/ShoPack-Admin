import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/core/helper/local/shared_preference.dart';
import 'package:shopack_admin/dependency_injection.dart';
import 'business_logic/bloc/login_bloc.dart';
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
          create: (context) => LoginBloc(injector()),
        )
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

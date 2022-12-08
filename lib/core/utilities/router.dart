import 'package:flutter/material.dart';
import 'package:shopack_admin/presentation/views/layout.dart';
import '../../presentation/views/login.dart';
import '../utilities/routes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case AppRoutes.layout:
      return MaterialPageRoute(
        builder: (context) => const LayoutPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  }
}



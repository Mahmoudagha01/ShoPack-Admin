import 'package:flutter/material.dart';
import 'package:shopack_admin/presentation/views/addProduct.dart';
import 'package:shopack_admin/presentation/views/edit_product.dart';
import 'package:shopack_admin/presentation/views/layout.dart';
import '../../data/models/all_product_model.dart';
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
    case AppRoutes.addProduct:
      return MaterialPageRoute(
        builder: (context) => AddProductView(),
      );
    case AppRoutes.editProduct:
      final product = settings.arguments as AllProductModel;
      return MaterialPageRoute(
        builder: (context) => EditProductView(product: product),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  }
}

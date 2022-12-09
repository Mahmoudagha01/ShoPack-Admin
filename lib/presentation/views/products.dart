import 'package:flutter/material.dart';
import 'package:shopack_admin/core/utilities/routes.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.addProduct);
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Product"))
          ],
        ),
      ),
    );
  }
}

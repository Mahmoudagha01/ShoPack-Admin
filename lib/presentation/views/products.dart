import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/core/utilities/routes.dart';
import 'package:shopack_admin/core/utilities/strings.dart';
import 'package:shopack_admin/presentation/widgets/alert_snackbar.dart';
import 'package:shopack_admin/presentation/widgets/product_list_tile.dart';
import '../../business_logic/products/products_bloc.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addProduct);
          },
          label: Row(
            children: const [Icon(Icons.add), Text(AppStrings.addProduct)],
          )),
      body: SafeArea(
        child: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {
            if (state is DeleteProductsLoadedState && state.data.success) {
              showSnackbar(state.data.message!, context, Colors.green);
            } else if (state is DeleteProductsLoadedState) {
              showSnackbar(state.data.message!, context, Colors.red);
            }
          },
          builder: (context, state) {
            if (state is GetAllProductsLoadingState ||
                state is DeleteProductsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllProductsLoadedState) {
              final product = state.data.products;
              return Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            "All Products : ${state.data.products.length}",
                            style: Theme.of(context).textTheme.headline6,
                          ))),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: product.length,
                        itemBuilder: (context, index) =>
                            ProductListTile(product: product[index])),
                  ),
                ],
              );
            } else if (state is GetAllProductsErrorState) {
              return Text(state.message);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

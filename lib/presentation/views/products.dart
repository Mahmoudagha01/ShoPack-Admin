import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/core/utilities/routes.dart';
import 'package:shopack_admin/core/utilities/strings.dart';
import 'package:shopack_admin/presentation/widgets/alert_snackbar.dart';
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
          child: BlocListener<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is DeleteProductsLoadedState && state.data.success) {
            showSnackbar(state.data.message, context, Colors.green);
          } else if (state is DeleteProductsLoadedState) {
            showSnackbar(state.data.message, context, Colors.red);
          }
        },
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is GetAllProductsLoadingState ||
                state is DeleteProductsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllProductsLoadedState) {
              final product = state.data.products;
              return ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) => ListTile(
                  leading: SizedBox(
                      width: 50,
                      child: Image.network(product[index].images[0].url)),
                  title: Text(product[index].name,
                      overflow: TextOverflow.ellipsis),
                  subtitle: Text(product[index].category),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.editProduct,
                              arguments: product[index]);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          BlocProvider.of<ProductsBloc>(context)
                              .add(DeleteProduct(product[index].id));
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is GetAllProductsErrorState) {
              return Text(state.message);
            } else {
              return const SizedBox();
            }
          },
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/products/products_bloc.dart';
import '../../core/utilities/routes.dart';
import '../../core/utilities/strings.dart';
import '../../data/models/all_product_model.dart';

class ProductListTile extends StatelessWidget {
  final AllProductModel product;

  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          width: 50, child: Image.network(product.images[0].url)),
      title: Text(product.name, overflow: TextOverflow.ellipsis),
      subtitle: Text(product.category),
      trailing: PopupMenuButton<int>(
        onSelected: (value) {
          switch (value) {
            case 0:
              Navigator.pushNamed(context, AppRoutes.reviews,arguments: product.id);
                BlocProvider.of<ProductsBloc>(context).add(GetReviews(product.id));
              break;
            case 1:
              Navigator.pushNamed(context, AppRoutes.editProduct,
                  arguments: product);
              break;
            case 2:
              BlocProvider.of<ProductsBloc>(context)
                  .add(DeleteProduct(product.id));
          }
        },
        tooltip: 'Settings',
        itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
          PopupMenuItem(
              value: 0,
              child: Row(
                children: const [
                  Icon(Icons.comment_outlined),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(AppStrings.showReviews),
                  )
                ],
              )),
          PopupMenuItem(
            value: 1,
            child: Row(
              children: const [
                Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(AppStrings.editProduct),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              children: const [
                Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(AppStrings.deleteProduct),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

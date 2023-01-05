import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/core/utilities/routes.dart';
import 'package:shopack_admin/core/utilities/strings.dart';
import '../../business_logic/products/products_bloc.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
   ScrollController? _hideButtonController;
   var  _isVisible;
     @override
  void initState() {
        _isVisible = true;
    _hideButtonController =  ScrollController();
    _hideButtonController!.addListener((){
      if(_hideButtonController!.position.userScrollDirection == ScrollDirection.reverse){
        if(_isVisible == true) {
            /* only set when the previous state is false
             * Less widget rebuilds 
             */
            print("**** ${_isVisible} up"); //Move IO away from setState
            setState((){
              _isVisible = false;
            });
        }
      } else {
        if(_hideButtonController!.position.userScrollDirection == ScrollDirection.forward){
          if(_isVisible == false) {
              /* only set when the previous state is false
               * Less widget rebuilds 
               */
               print("**** ${_isVisible} down"); //Move IO away from setState
               setState((){
                 _isVisible = true;
               });
           }
        }
    }});
    super.initState();
  }
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
      body: SafeArea(child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is GetAllProductsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllProductsLoadedState) {
            final product = state.data.products;
            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) => ListTile(
                leading: SizedBox(
                    width: 50,
                    child: Image.network(product[index].images[0].url)),
                title:
                    Text(product[index].name, overflow: TextOverflow.ellipsis),
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
                        Navigator.pushNamed(context, AppRoutes.editProduct,arguments: product[index]);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {},
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
      )),
    );
  }
}

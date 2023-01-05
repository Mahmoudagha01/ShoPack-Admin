import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/products/products_bloc.dart';
import '../../core/utilities/strings.dart';
import '../../data/models/all_product_model.dart';
import '../widgets/alert_snackbar.dart';
import '../widgets/maintextformfield.dart';

class EditProductView extends StatefulWidget {
  final AllProductModel product;
  const EditProductView({super.key, required this.product});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController pName = TextEditingController();

  final TextEditingController pDescription = TextEditingController();
  final TextEditingController pStock = TextEditingController();
  final TextEditingController pPrice = TextEditingController();
  @override
  void initState() {
    pName.text = widget.product.name;
    pDescription.text = widget.product.description;
    pPrice.text = widget.product.price.toString();
    pStock.text = widget.product.stock.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(AppStrings.editProduct),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<ProductsBloc>(context).add(GetAllProducts());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                MainTFF(
                    labelText: AppStrings.producName,
                    controller: pName,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emptyName;
                      }
                      return null;
                    },
                    border: const OutlineInputBorder(),
                    max: 1,
                    isPassword: false,
                    borderRadius: 16,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 15,
                ),
                MainTFF(
                    labelText: AppStrings.productPrice,
                    controller: pPrice,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emptyPrice;
                      }
                      return null;
                    },
                    border: const OutlineInputBorder(),
                    max: 1,
                    isPassword: false,
                    borderRadius: 16,
                    inputType: TextInputType.number),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    return Material(
                      elevation: 1.5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: const SizedBox(),
                            borderRadius: BorderRadius.circular(12),
                            value: BlocProvider.of<ProductsBloc>(context)
                                .dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: BlocProvider.of<ProductsBloc>(context)
                                .items
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              BlocProvider.of<ProductsBloc>(context)
                                  .add(ChangeDropDownValue(newValue!));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                MainTFF(
                    labelText: AppStrings.desc,
                    controller: pDescription,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emptyDesc;
                      }
                      return null;
                    },
                    border: const OutlineInputBorder(),
                    max: 5,
                    isPassword: false,
                    borderRadius: 16,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 15,
                ),
                MainTFF(
                    labelText: AppStrings.productStock,
                    controller: pStock,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emptyStock;
                      }
                      return null;
                    },
                    border: const OutlineInputBorder(),
                    max: 1,
                    isPassword: false,
                    borderRadius: 16,
                    inputType: TextInputType.number),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    BlocProvider.of<ProductsBloc>(context).add(UploadImage());
                  },
                  child: Material(
                    elevation: 1.5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                          child: Text(
                        AppStrings.photoGalley,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.blue),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state is UploadImagesState) {
                      return SizedBox(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: GridView.builder(
                              itemCount: state.images.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      image: DecorationImage(
                                          image: FileImage(File(
                                            state.images[index].path,
                                          )),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    } else if (state is UploadImagesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocConsumer<ProductsBloc, ProductsState>(
                  listener: (context, state) {
                    if (state is AddProductsLoadedState && state.data.success) {
                      showSnackbar(
                        AppStrings.edieProductsuccess,
                        context,
                        Colors.green,
                      );
                    } else if (state is AddProductsErrorState) {
                      showSnackbar(state.message, context, Colors.red);
                    } else if (state is AddProductsLoadedState) {
                      showSnackbar(
                        AppStrings.forbiddenError,
                        context,
                        Colors.red,
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is AddProductsLoadingState
                        ? const CircularProgressIndicator()
                        : ElevatedButton.icon(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ProductsBloc>(context).add(
                                  EditProduct(
                                    pName.text,
                                    pPrice.text,
                                    BlocProvider.of<ProductsBloc>(context)
                                        .dropdownvalue,
                                    pDescription.text,
                                    pStock.text,
                                    BlocProvider.of<ProductsBloc>(context)
                                        .imagesUrls,
                                    widget.product.id,
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text(
                              AppStrings.editProduct,
                            ),
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

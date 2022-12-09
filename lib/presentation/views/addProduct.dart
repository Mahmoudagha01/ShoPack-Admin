import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopack_admin/business_logic/products/products_bloc.dart';
import 'package:shopack_admin/core/utilities/strings.dart';
import 'package:shopack_admin/presentation/widgets/maintextformfield.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController pName = TextEditingController();

  final TextEditingController pDescription = TextEditingController();

  final TextEditingController pPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addProduct),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
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
                  height: 10,
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
                    return state is UploadImagesState
                        ? SizedBox(
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                          )
                        : const SizedBox();
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

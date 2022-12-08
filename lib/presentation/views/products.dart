import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
     SafeArea(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Add Product"))
        ],
       ),
     ),);
  }
}
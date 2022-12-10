import 'package:equatable/equatable.dart';

class ProductsModel extends Equatable {
  final bool success;
  final ProductModel products;

  const ProductsModel(
    this.success,
    this.products,
  );
  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      json['success'],
            ProductModel.fromJson(json['product']));
   

  @override
  List<Object> get props => [success, products];
}

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final int price;
  final num ratings;
  final List<ImageModel> images;
  final String category;
  final int stock;
  final int numOfReviews;
  final String user;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.ratings,
    required this.images,
    required this.category,
    required this.stock,
    required this.numOfReviews,
    required this.user,

  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        ratings: json['ratings'],
        images: List<ImageModel>.from(
            json['images'].map((x) => ImageModel.fromJson(x))),
        category: json['category'],
        stock: json['stock'],
        numOfReviews: json['numOfReviews'],
        user: json['user'],
        
      );
  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      price,
      ratings,
      images,
      category,
      stock,
      numOfReviews,
      user,

    ];
  }
}

class ImageModel extends Equatable {
  final String publicid;
  final String url;

  const ImageModel(this.publicid, this.url);
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(json['public_id'], json['url']);
  @override
  List<Object> get props => [publicid, url];
}



class AddProductParams {
  final String name;
  final String price;
  final String category;
  final String description;
  final String stock;
  final List images;

  AddProductParams(this.name, this.price, this.category, this.description, this.stock, this.images);
}

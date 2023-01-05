import 'package:equatable/equatable.dart';

class AllProductsModel extends Equatable {
  final bool success;
  final List<AllProductModel> products;

  const AllProductsModel(
    this.success,
    this.products,
  );
  factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
      json['success'],
   List<AllProductModel>.from(
          json['products'].map((x) => AllProductModel.fromJson(x))),
           );
   

  @override
  List<Object> get props => [success, products];
}

class AllProductModel extends Equatable {
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

  const AllProductModel({
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
  factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        ratings: json['ratings']??0,
        images: List<ImageModel>.from(
            json['images'].map((x) => ImageModel.fromJson(x))),
        category: json['category'],
        stock: json['stock'],
        numOfReviews: json['numOfReviews']??0,
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


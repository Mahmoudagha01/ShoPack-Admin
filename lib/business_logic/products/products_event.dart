part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends ProductsEvent {}

class ChangeDropDownValue extends ProductsEvent {
  final String newValue;

  const ChangeDropDownValue(this.newValue);
}

class CreateProduct extends ProductsEvent {
  final String name;
  final String price;
  final String category;
  final String description;
  final String stock;
  final List images;

  const CreateProduct(this.name, this.price, this.category, this.description,
      this.stock, this.images);
}

class GetAllProducts extends ProductsEvent {}

class EditProduct extends ProductsEvent {
  final String name;
  final String price;
  final String category;
  final String description;
  final String stock;
  final String id;
  final List images;

  const EditProduct(this.name, this.price, this.category, this.description,
      this.stock, this.images, this.id);
}

class DeleteProduct extends ProductsEvent {
    final String id;

  const DeleteProduct(this.id);
}
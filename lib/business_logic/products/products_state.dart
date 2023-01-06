part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}
class UploadImagesLoadingState extends ProductsState {
  
}


class UploadImagesState extends ProductsState {
  final List<XFile> images;

  const UploadImagesState(this.images);
}

class DropdownUnSelectedState extends ProductsState {}

class DropdownSelectedState extends ProductsState {}

class AddProductsLoadingState extends ProductsState {}

class AddProductsLoadedState extends ProductsState {
  final ProductsModel data;

  const AddProductsLoadedState(this.data);
}

class AddProductsErrorState extends ProductsState {
  final String message;

  const AddProductsErrorState(this.message);
}

class GetAllProductsLoadingState extends ProductsState {}

class GetAllProductsLoadedState extends ProductsState {
  final AllProductsModel data;

  const GetAllProductsLoadedState(this.data);
}

class GetAllProductsErrorState extends ProductsState {
  final String message;

  const GetAllProductsErrorState(this.message);
}

class DeleteProductsLoadingState extends ProductsState {}

class DeleteProductsLoadedState extends ProductsState {
  final ResponseModel data;
  const DeleteProductsLoadedState(this.data);
}

class DeleteProductsErrorState extends ProductsState {
  final String message;
  const DeleteProductsErrorState(this.message);
}

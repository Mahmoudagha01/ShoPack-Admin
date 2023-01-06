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


class GetReviewsLoadingState extends ProductsState {}

class GetReviewsLoadedState extends ProductsState {
  final ReviewsModel data;
  const GetReviewsLoadedState(this.data);
}

class GetReviewsErrorState extends ProductsState {
  final String message;
  const GetReviewsErrorState(this.message);
}

class DeleteReviewLoadingState extends ProductsState {}

class DeleteReviewLoadedState extends ProductsState {
  final ResponseModel data;
  const DeleteReviewLoadedState(this.data);
}

class DeleteReviewErrorState extends ProductsState {
  final String message;
  const DeleteReviewErrorState(this.message);
}

part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class UploadImagesLoadingState extends ProductsState {}

class UploadImagesState extends ProductsState {
  final List<XFile> images;

  const UploadImagesState(this.images);
}

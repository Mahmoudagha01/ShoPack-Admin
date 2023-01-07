import 'package:bloc/bloc.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopack_admin/data/models/product_model.dart';
import 'package:shopack_admin/data/repositories/product/product_repository.dart';
import '../../core/env/env.dart';
import '../../core/utilities/params.dart';
import '../../data/models/all_product_model.dart';
import '../../data/models/response_model.dart';
import '../../data/models/reviews_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductRepository productRepository;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  List<String> imagesUrls = [];
  String dropdownvalue = 'Category';
  List<CloudinaryResponse> responses = [];
  var items = [
    "Category",
    "Electronics",
    "Clothes",
    "Books",
    "Shoes",
    "Camera",
    "Sports",
    "Smartphones",
  ];
  ProductsBloc(
    this.productRepository,
  ) : super(ProductsInitial()) {
    on<UploadImage>((event, emit) async {
      final List<XFile> selectedImages = await imagePicker.pickMultiImage();
      emit(UploadImagesLoadingState());
      if (selectedImages.isNotEmpty) {
        imageFileList.addAll(selectedImages);
        final resources = await Future.wait(
          imageFileList.map(
            (file) async => CloudinaryUploadResource(
              filePath: file.path,
              resourceType: CloudinaryResourceType.image,
            ),
          ),
        );

        final cloudinary = Cloudinary.full(
            apiKey: Env.apiKey,
            apiSecret: Env.secretKey,
            cloudName: Env.nameKey);
        responses = await cloudinary.uploadResources(resources);

        for (var response in responses) {
          if (response.isSuccessful) {
            var path = response.secureUrl;
            imagesUrls.add(path!);
          }
        }
      }
      emit(UploadImagesState(imageFileList));
      imageFileList = [];
    });
    on<ChangeDropDownValue>((event, emit) {
      emit(DropdownUnSelectedState());
      dropdownvalue = event.newValue;
      emit(DropdownSelectedState());
    });

    on<CreateProduct>((event, emit) async {
      emit(AddProductsLoadingState());
      final failureOrSuccess = await productRepository.addProduct(
          AddProductParams(event.name, event.price, event.category,
              event.description, event.stock, event.images));
      failureOrSuccess.fold(
          (failure) => emit(AddProductsErrorState(failure.message)), (success) {
        emit(AddProductsLoadedState(success));
        dropdownvalue = 'Category';
      });
    });

    on<GetAllProducts>((event, emit) async {
      emit(GetAllProductsLoadingState());
      final failureOrSuccess =
          await productRepository.getAllProducts(NoParams());
      failureOrSuccess
          .fold((failure) => emit(GetAllProductsErrorState(failure.message)),
              (success) {
        emit(GetAllProductsLoadedState(success));
      });
    });

    on<EditProduct>((event, emit) async {
      emit(AddProductsLoadingState());
      final failureOrSuccess = await productRepository.editProduct(
          EditProductParams(event.name, event.price, event.category,
              event.description, event.stock, event.images, event.id));
      failureOrSuccess.fold(
          (failure) => emit(AddProductsErrorState(failure.message)), (success) {
        emit(AddProductsLoadedState(success));
      });
    });

    on<DeleteProduct>((event, emit) async {
      emit(DeleteProductsLoadingState());
      final failureOrSuccess =
          await productRepository.deleteProduct(DeleteProductParams(event.id));
      failureOrSuccess
          .fold((failure) => emit(DeleteProductsErrorState(failure.message)),
              (success) {
        add(GetAllProducts());
        emit(DeleteProductsLoadedState(success));
      });
    });
    on<GetReviews>((event, emit) async {
      emit(GetReviewsLoadingState());
      final failureOrSuccess =
          await productRepository.getReviews(GetReviewsParams(event.id));
      failureOrSuccess.fold(
          (failure) => emit(GetReviewsErrorState(failure.message)), (success) {
        emit(GetReviewsLoadedState(success));
      });
    });

    on<DeleteReview>((event, emit) async {
      emit(DeleteReviewLoadingState());
      final failureOrSuccess = await productRepository
          .deleteReview(DeleteReviewsParams(event.productId, event.reviewId));
      failureOrSuccess
          .fold((failure) => emit(DeleteReviewErrorState(failure.message)),
              (success) {
        add(GetReviews(event.productId));
        emit(DeleteReviewLoadedState(success));
      });
    });
  }
}

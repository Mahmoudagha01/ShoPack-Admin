import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<UploadImage>((event, emit) async {
      emit(UploadImagesLoadingState());
      final List<XFile> selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        imageFileList.addAll(selectedImages);
      }
      emit(UploadImagesState(imageFileList));
    });
  }
}

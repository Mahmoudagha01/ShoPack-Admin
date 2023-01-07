class NoParams {}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}

class AddProductParams {
  final String name;
  final String price;
  final String category;
  final String description;
  final String stock;
  final List images;

  AddProductParams(this.name, this.price, this.category, this.description,
      this.stock, this.images);
}

class EditProductParams {
  final String name;
  final String price;
  final String category;
  final String description;
  final String stock;
  final List images;
  final String id;
  EditProductParams(this.name, this.price, this.category, this.description,
      this.stock, this.images, this.id);
}

class DeleteProductParams {
  final String id;

  DeleteProductParams(this.id);
}

class GetReviewsParams {
  final String id;

  GetReviewsParams(this.id);
}

class DeleteReviewsParams {
  final String productId;
  final String reviewId;

  DeleteReviewsParams(this.productId, this.reviewId);
}

class UpdateOrderParams {
  final String id;

  UpdateOrderParams(this.id);
}

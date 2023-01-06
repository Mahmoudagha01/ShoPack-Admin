import 'package:equatable/equatable.dart';

class ReviewsModel extends Equatable {
  final bool succes;
  final List<ReviewModel> reviews;

  const ReviewsModel(this.succes, this.reviews);
  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
      json['success'],
      List<ReviewModel>.from(
          json['reviews'].map((x) => ReviewModel.fromJson(x))));

  @override
  List<Object> get props => [succes, reviews];
}

class ReviewModel extends Equatable {
  final String? user;
  final String? name;
    final String? id;
  final num? rating;
  final String? comment;
  final DateTime? createdAt;
  const ReviewModel(this.id,
      this.user, this.name, this.rating, this.comment, this.createdAt);

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    json['_id']??'',
      json["user"] ?? "",
      json['name'] ?? "",
      json['rating'] ?? 0,
      json['comment'] ?? "",
      DateTime.parse(json['createdAt']));

  @override
  List<Object?> get props => [id,user, name, rating, comment];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable {
  final String message;
  final bool success;
  const ResponseModel({
    required this.message,
    required this.success,
  });
  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
       success: json['success'],
       message: json['message']??'', 

      );

  @override
  List<Object> get props => [message, success];
}

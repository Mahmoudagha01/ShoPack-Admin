import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String ? id;
  final String? name;
  final String? email;
  final String? role;
  final String ?message;
  final bool ?success;
  final DateTime ?createdAt;
  final String? token;

  const LoginModel(
      { this.id,
       this.name,
       this.message,
       this.success,
       this.email,
       this.role,
       this.createdAt,
       this.token});

        factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["_id"]??"",
        name: json["name"]??"",
        email: json["email"]??"",
        role: json["role"]??"admin",
        createdAt: DateTime.parse(json["createdAt"]??"2022-11-26T18:08:07.693Z") ,
        token: json["token"]??"",
        success: json["success"]??true,
        message: json["message"]??"wellcome",
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      success,
      message,
      role,
      createdAt,
      token,
    ];
  }
}



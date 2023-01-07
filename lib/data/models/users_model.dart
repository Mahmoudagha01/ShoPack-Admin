import 'package:equatable/equatable.dart';

class UsersModel extends Equatable {
  final bool success;
  final List<UserModel> users;

  const UsersModel(this.success, this.users);
  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
      json['success'],
      List<UserModel>.from(json['users'].map((x) => UserModel.fromJson(x))));

  @override
  List<Object?> get props => [success, users];
}

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String role;
  final DateTime createAt;
  final AvatarModel? avatar;
  const UserModel(
      this.id, this.name, this.email, this.role, this.createAt, this.avatar);
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      json['_id'],
      json['name'],
      json['email'],
      json['role'],
      DateTime.parse(json['createdAt']),
      json['avatar'] != null
          ? AvatarModel.fromJson(json['avatar'])
          : const AvatarModel("publicId",
              'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png'));

  @override
  List<Object?> get props {
    return [id, name, email, role, createAt, avatar];
  }
}

class AvatarModel extends Equatable {
  final String publicId;
  final String url;

  const AvatarModel(this.publicId, this.url);
  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      AvatarModel(json['public_id'], json['url']);
  @override
  List<Object> get props => [publicId, url];
}

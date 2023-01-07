part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsers extends UserEvent {}

class UpdateRole extends UserEvent {
  final String id;
  final String role;

  const UpdateRole(this.id, this.role);
}

class DeleteUser extends UserEvent {
  final String id;

  const DeleteUser(this.id);
}

part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class GetAllUsersLoadingState extends UserState {}

class GetAllUsersLoadedState extends UserState {
  final UsersModel data;

  const GetAllUsersLoadedState(this.data);
}

class GetAllUsersErrorState extends UserState {
  final String message;

  const GetAllUsersErrorState(this.message);
}

class UpdateRoleLoadedState extends UserState {
  final ResponseModel data;

  const UpdateRoleLoadedState(this.data);
}

class DeleteUserLoadedState extends UserState {
  final ResponseModel data;

  const DeleteUserLoadedState(this.data);
}

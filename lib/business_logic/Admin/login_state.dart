part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}
class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginFinishedState extends LoginState {
  final LoginModel data;

  const LoginFinishedState(this.data);
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState(this.message);
}

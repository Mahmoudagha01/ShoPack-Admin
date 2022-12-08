part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AdminLogin  extends LoginEvent{
  final String email;
  final String password;

  const AdminLogin(this.email, this.password);
}

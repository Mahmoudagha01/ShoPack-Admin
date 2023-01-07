import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopack_admin/data/repositories/admin/admin_repository.dart';
import '../../core/utilities/params.dart';
import '../../data/models/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AdminRepository adminRepository;
  LoginBloc(
    this.adminRepository,
  ) : super(LoginInitial()) {
    on<AdminLogin>((event, emit) async {
      emit(LoginLoadingState());
      final failureOrSuccess = await adminRepository
          .login(LoginParams(email: event.email, password: event.password));
      failureOrSuccess.fold((failure) => emit(LoginErrorState(failure.message)),
          (success) => emit(LoginFinishedState(success)));
    });
  }
}

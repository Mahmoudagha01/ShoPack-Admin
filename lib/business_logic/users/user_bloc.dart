import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopack_admin/core/utilities/params.dart';
import 'package:shopack_admin/data/repositories/users/users_repository.dart';

import '../../data/models/response_model.dart';
import '../../data/models/users_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;
  UserBloc(this.usersRepository) : super(UserInitial()) {
    on<GetUsers>((event, emit) async {
      emit(GetAllUsersLoadingState());
      final failureOrSuccess = await usersRepository.getAllUsers(NoParams());
      failureOrSuccess.fold(
          (failure) => emit(GetAllUsersErrorState(failure.message)), (success) {
        emit(GetAllUsersLoadedState(success));
      });
    });

    on<UpdateRole>((event, emit) async {
      emit(GetAllUsersLoadingState());
      final failureOrSuccess = await usersRepository
          .updateRole(UpdateRoleParams(event.id, event.role));
      failureOrSuccess.fold(
          (failure) => emit(GetAllUsersErrorState(failure.message)), (success) {
        emit(UpdateRoleLoadedState(success));
        add(GetUsers());
      });
    });
  }
}

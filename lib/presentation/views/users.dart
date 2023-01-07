import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/presentation/widgets/alert_snackbar.dart';
import 'package:shopack_admin/presentation/widgets/user_card.dart';
import '../../business_logic/users/user_bloc.dart';
import '../../core/utilities/strings.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UpdateRoleLoadedState) {
              showSnackbar(state.data.message!, context, Colors.green);
            } else if(state is DeleteUserLoadedState){
               showSnackbar(state.data.message!, context, Colors.green);
            }
          },
          builder: (context, state) {
            if (state is GetAllUsersLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllUsersLoadedState) {
              return state.data.users.isNotEmpty
                  ? Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Text(
                                  "All Users : ${state.data.users.length}",
                                  style: Theme.of(context).textTheme.headline6,
                                ))),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: state.data.users.length,
                              itemBuilder: (context, index) =>
                                  UserCard(user: state.data.users[index])),
                        ),
                      ],
                    )
                  : const Center(child: Text(AppStrings.noUsers));
            } else if (state is GetAllUsersErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

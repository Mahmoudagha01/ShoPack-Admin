import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../business_logic/users/user_bloc.dart';
import '../../core/utilities/strings.dart';
import '../../data/models/users_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 4),
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(user.email,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.grey)),
                    const Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "role : ${user.role}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          user.role == "user"
                              ? TextButton.icon(
                                  onPressed: () {
                                    BlocProvider.of<UserBloc>(context)
                                        .add(UpdateRole(user.id, "admin"));
                                  },
                                  icon:
                                      const Icon(Icons.add_moderator_outlined),
                                  label: const Text(AppStrings.promote))
                              : TextButton.icon(
                                  onPressed: () {
                                    BlocProvider.of<UserBloc>(context)
                                        .add(UpdateRole(user.id, "user"));
                                  },
                                  icon: const Icon(
                                      Icons.remove_moderator_outlined),
                                  label: const Text(AppStrings.unpromote))
                        ],
                      ),
                    ),
                    Text(
                      "Account Created at ${DateFormat.yMMMEd().format(user.createAt)}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
            child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(user.avatar!.url),
        ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_clean_architecture/presentation/bloc/user_cubit/cubit/user_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<UserCubit>();
    cubit.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        {
          if (state is UserError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Error in Loading data")));
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc APi Call'),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UsersFetched) {
              final users = state.userList;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    elevation: 5.0,
                    // shape: ShapeBorder.lerp(22, b, t),

                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            user.username,
                            style: TextStyle(fontSize: 22, color: Colors.green),
                          ),
                          Text(user.username),
                          Text(user.email),
                          Text(user.company.name),
                          Text(user.website),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

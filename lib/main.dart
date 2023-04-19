import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_clean_architecture/data/data_source/user_data_source.dart';
import 'package:flutter_bloc_app_clean_architecture/data/repository/user_repo.dart';
import 'package:flutter_bloc_app_clean_architecture/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_app_clean_architecture/presentation/screens/user_screen.dart';
import 'package:flutter_bloc_app_clean_architecture/presentation/user_cubit/cubit/user_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  bloc provider
    return BlocProvider(
      create: (context) => UserCubit(UserRepository(UserDataSource())),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserScreen(),
      ),
    );
  }
}

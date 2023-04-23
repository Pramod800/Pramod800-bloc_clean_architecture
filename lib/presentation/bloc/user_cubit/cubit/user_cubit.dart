import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app_clean_architecture/data/models/user_models.dart';
import 'package:flutter_bloc_app_clean_architecture/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repository _userRepository;
  UserCubit(this._userRepository) : super(UserInitial());

  void getUsers() async {
    // loading state
    emit(UserLoading());
    try {
      final userData = await _userRepository.getUsersFormApi();
      emit(UsersFetched(userData));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}

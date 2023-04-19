part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UsersFetched extends UserState {
  UsersFetched(this.userList);
  final List<UsersModel> userList;
  @override
  List<Object> get props => [userList];
}

class UserError extends UserState {
  final String message;
  UserError(this.message);

  @override
  List<Object> get props => [message];
}

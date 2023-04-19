import 'package:flutter_bloc_app_clean_architecture/data/data_source/user_data_source.dart';
import 'package:flutter_bloc_app_clean_architecture/data/models/user_models.dart';

class UserRepository {
  UserRepository(this._movieDataSource);

  late final UserDataSource _movieDataSource;

  Future<List<UsersModel>> getUsersFormApi() async {
    return _movieDataSource.getUsers();
  }
}

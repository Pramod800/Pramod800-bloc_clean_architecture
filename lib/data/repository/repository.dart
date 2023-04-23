import 'package:flutter_bloc_app_clean_architecture/data/data_source/data_source.dart';
import 'package:flutter_bloc_app_clean_architecture/data/models/postModel.dart';
import 'package:flutter_bloc_app_clean_architecture/data/models/user_models.dart';

class Repository {
  Repository(this._dataSource);

  late final DataSource _dataSource;

  Future<List<UsersModel>> getUsersFormApi() async {
    return _dataSource.getUsers();
  }

  Future<PostModel> getPosts() async {
    return _dataSource.fetchPosts();
  }
}

import 'dart:convert';
import 'package:flutter_bloc_app_clean_architecture/data/models/user_models.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  late List<UsersModel> userData = [];
  Future<List<UsersModel>> getUsers() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(url);
    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('$response.statusCode');
      for (Map<String, dynamic> i in responseData) {
        userData.add(UsersModel.fromJson(i));
      }
      return userData;
    } else {
      return userData;
    }
  }
}

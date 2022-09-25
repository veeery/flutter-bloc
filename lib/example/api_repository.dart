import 'package:dio/dio.dart';
import 'package:flutter_veeery_bloc/example/model/user.dart';
import 'package:flutter_veeery_bloc/service/network/app_dio.dart';

class Api {

  static final String baseUrl = AppDio.baseUrl;

  Future<List<User>> fetchUsers() async {
    List<User> users = [];

    bool apiResult = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get("users?page=2");

      List<dynamic> result = response.data['data'];

      for (var json in result) {
        users.add(User.fromJson(json));
      }

    });

    return users;
  }
}
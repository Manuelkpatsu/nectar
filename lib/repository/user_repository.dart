import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nectar/model/user.dart';

class UserRepository {
  UserRepository();

  Future<User> getUser() async {
    String jsonString = await rootBundle.loadString('data/user.json');
    dynamic decodedJson = json.decode(jsonString);

    User user = User.fromJson(decodedJson);
    return user;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserRemoteDatasource {
  Future<User> getUserData(int uid) async {
    // var uri =
    //     Uri.parse("dbsvehiclerentalsystem.000webhostapp.com/user/get_user.php")
    //         .replace(queryParameters: {
    //   "uid": [uid.toString()]
    // });
    var uri = Uri.https(
        "dbsvehiclerentalsystem.000webhostapp.com", '/user/get_user.php', {
      "uid": [uid.toString()]
    });
    print(uri.toString());
    var client = http.Client();
    var response = await http.get(uri);
    var val = json.decode(response.body);
    print(val['data'][0]);
    return User.fromJson(val['data'][0]);
  }
}

void main(List<String> args) {
  print(UserRemoteDatasource().getUserData(2));
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserRemoteDatasource {
  Future<User> getUserData(int uid) async {
    var uri = Uri.https(
        "dbsvehiclerentalsystem.000webhostapp.com", '/user/get_user.php', {
      "uid": [uid.toString()]
    });
    print(uri.toString());
    
    var response = await http.get(uri);
    var val = json.decode(response.body);
    print(val['data'][0]);
    return User.fromJson(val['data'][0]);
  }

  Future<List<User>> adminGetUserData() async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/user/admin_get_users.php');
    print(uri.toString());
    
    var response = await http.get(uri);
    var val = json.decode(response.body);
    print(response.body);
    List<User> users = [];
    for (var i = 0; i < val['data'].length; i++) {
      users.add(User.fromJson(val['data'][i]));
    }
    return users;
  }

  Future<void> signUp(User user) async {
    var uri = Uri.https(
        "dbsvehiclerentalsystem.000webhostapp.com", '/user/signup.php');
    print(uri.toString());
    
    var val = user.toJson();
    print(val);
    var response = await http.post(uri, body: json.encode(val));

    print(response.body);
  }

  Future<User?> signIn(User user) async {
    var uri = Uri.https(
        "dbsvehiclerentalsystem.000webhostapp.com", '/user/login.php');

    var val = user.toJson();
    var response = await http.post(uri, body: json.encode(val));
    var body = json.decode(response.body);

    if(body["success"] == true) {
      return User.fromJson(body["data"]);
    }
    else {
      return null;
    }
  }

  Future<void> updateUserDetails(User user) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/user/update_details.php', {
      'uid': [user.id.toString()]
    });
    print(uri.toString());
    
    var val = user.toJson();
    var response = await http.post(uri, body: json.encode(val));

    print(response.body);
  }

  Future<void> updatePassword(int uid, String newPassword) async {
    var uri = Uri.https(
        "dbsvehiclerentalsystem.000webhostapp.com", '/user/update_passwd.php', {
      'uid': [uid.toString()]
    });
    print(uri.toString());
    
    var val = {"password": newPassword};
    var response = await http.post(uri, body: json.encode(val));

    print(response.body);
  }
}

void main(List<String> args) async {
  print(await UserRemoteDatasource().getUserData(2));
  print(await UserRemoteDatasource().getUserData(1));
  User user = User(
      id: 1,
      name: "Anuhya",
      phoneNumber: "9887602340",
      age: 19,
      gender: 'F',
      emailId: "hmm,anuhya@thinking.com",
      address: "Bellandur, Bangalore",
      zipcode: "560103",
      licenseId: "KA1230067812");
  print(UserRemoteDatasource().updatePassword(1, "Cache to my heart"));
}

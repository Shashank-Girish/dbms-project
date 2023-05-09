import 'dart:convert';

class User {
  late int id;
  String? name;
  String? phoneNumber;
  int? age;
  String? gender;
  String? emailId;
  String? address;
  String? zipcode;
  String? licenseId;
  String? password;

  User(
      {id,
      name,
      phoneNumber,
      age,
      gender,
      emailId,
      address,
      zipcode,
      licenseId,
      password});

  factory User.fromJson(Map<String, String> json) {
    return User(
        id: int.parse(json['id']!),
        name: json['name'],
        phoneNumber: json['phone_number'],
        age: int.parse(json["age"]!),
        gender: json['gender'],
        emailId: json['email_id'],
        address: json['address'],
        zipcode: json['zipcode'],
        licenseId: json['license_id'],
        password: json['password']);
  }
}

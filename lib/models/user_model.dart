import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  int? id;
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
      {
      this.id,
      this.name,
      this.phoneNumber,
      this.age,
      this.gender,
      this.emailId,
      this.address,
      this.zipcode,
      this.licenseId,
      this.password});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

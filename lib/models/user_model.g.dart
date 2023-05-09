// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      age: json['age'],
      gender: json['gender'],
      emailId: json['emailId'],
      address: json['address'],
      zipcode: json['zipcode'],
      licenseId: json['licenseId'],
      password: json['password'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'age': instance.age,
      'gender': instance.gender,
      'emailId': instance.emailId,
      'address': instance.address,
      'zipcode': instance.zipcode,
      'licenseId': instance.licenseId,
      'password': instance.password,
    };

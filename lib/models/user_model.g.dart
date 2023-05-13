// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      emailId: json['emailId'] as String?,
      address: json['address'] as String?,
      zipcode: json['zipcode'] as String?,
      licenseId: json['licenseId'] as String?,
      password: json['password'] as String?,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      emailId: json['emailId'],
      zipcode: json['zipcode'],
      password: json['password'],
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'emailId': instance.emailId,
      'zipcode': instance.zipcode,
      'password': instance.password,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      emailId: json['email_id'],
      zipcode: json['zipcode'],
      password: json['password'],
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email_id': instance.emailId,
      'zipcode': instance.zipcode,
      'password': instance.password,
    };

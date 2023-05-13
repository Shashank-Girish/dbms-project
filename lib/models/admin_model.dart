import 'package:json_annotation/json_annotation.dart';

part 'admin_model.g.dart';

@JsonSerializable()
class Admin {
  int? id;
  String? name;
  String? phoneNumber;
  String? emailId;
  String? zipcode;
  String? password;

  Admin({id, name, phoneNumber, emailId, zipcode, password});

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);

  Map<String, dynamic> toJson() => _$AdminToJson(this);
}

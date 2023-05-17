import 'package:json_annotation/json_annotation.dart';

part 'vehicle_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VehicleType {
  int? id;
  String? name;
  String? model;
  double? mileage;
  int? price;
  String? type;

  VehicleType(
      {this.id, this.name, this.model, this.mileage, this.price, this.type});

  factory VehicleType.fromJson(Map<String, dynamic> json) =>
      _$VehicleTypeFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleTypeToJson(this);
}

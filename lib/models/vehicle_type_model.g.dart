// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleType _$VehicleTypeFromJson(Map<String, dynamic> json) => VehicleType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      model: json['model'] as String?,
      mileage: (json['mileage'] as num?)?.toDouble(),
      price: json['price'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$VehicleTypeToJson(VehicleType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model': instance.model,
      'mileage': instance.mileage,
      'price': instance.price,
      'type': instance.type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: json['id'] as int?,
      locationId: json['locationId'] as int?,
      vehicleStatus: json['vehicleStatus'] as String?,
      age: json['age'] as int?,
      odometerReading: json['odometerReading'] as int?,
      registrationId: json['registrationId'] as int?,
      details: json['details'] as String?,
      vehicleTypeDetailsId: json['vehicleTypeDetailsId'] as int?,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'vehicleStatus': instance.vehicleStatus,
      'age': instance.age,
      'odometerReading': instance.odometerReading,
      'registrationId': instance.registrationId,
      'details': instance.details,
      'vehicleTypeDetailsId': instance.vehicleTypeDetailsId,
      'imgUrl': instance.imgUrl,
    };

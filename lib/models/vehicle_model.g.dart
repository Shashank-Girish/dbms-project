// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: json['id'] as int?,
      locationId: json['location_id'] as int?,
      vehicleStatus: json['vehicle_status'] as String?,
      age: json['age'] as int?,
      odometerReading: json['odometer_reading'] as int?,
      registrationId: json['registration_id'] as int?,
      details: json['details'] as String?,
      vehicleTypeDetailsId: json['vehicle_type_details_id'] as int?,
      imgUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'location_id': instance.locationId,
      'vehicle_status': instance.vehicleStatus,
      'age': instance.age,
      'odometer_reading': instance.odometerReading,
      'registration_id': instance.registrationId,
      'details': instance.details,
      'vehicle_type_details_id': instance.vehicleTypeDetailsId,
      'img_url': instance.imgUrl,
    };

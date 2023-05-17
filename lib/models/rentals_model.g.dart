// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rentals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rental _$RentalFromJson(Map<String, dynamic> json) => Rental(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      vehicleId: json['vehicle_id'] as int?,
      startLocationId: json['start_location_id'] as int?,
      endLocationId: json['end_location_id'] as int?,
      rentalStatus: json['rental_status'] as String?,
      numDays: json['num_days'] as int?,
      distance: json['distance'] as int?,
    );

Map<String, dynamic> _$RentalToJson(Rental instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'vehicle_id': instance.vehicleId,
      'start_location_id': instance.startLocationId,
      'end_location_id': instance.endLocationId,
      'rental_status': instance.rentalStatus,
      'num_days': instance.numDays,
      'distance': instance.distance,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rentals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rental _$RentalFromJson(Map<String, dynamic> json) => Rental(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      vehicleId: json['vehicleId'] as int?,
      startLocationId: json['startLocationId'] as int?,
      endLocationId: json['endLocationId'] as int?,
      rentalStatus: json['rentalStatus'] as String?,
      numDays: json['numDays'] as int?,
      distance: json['distance'] as int?,
    );

Map<String, dynamic> _$RentalToJson(Rental instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
      'startLocationId': instance.startLocationId,
      'endLocationId': instance.endLocationId,
      'rentalStatus': instance.rentalStatus,
      'numDays': instance.numDays,
      'distance': instance.distance,
    };

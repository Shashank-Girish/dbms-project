import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Vehicle {
  int? id;
  int? locationId;
  String? vehicleStatus;
  int? age;
  int? odometerReading;
  String? registrationId;
  String? details;
  int? vehicleTypeDetailsId;
  String? imgUrl;

  Vehicle(
      {this.id,
      this.locationId,
      this.vehicleStatus,
      this.age,
      this.odometerReading,
      this.registrationId,
      this.details,
      this.vehicleTypeDetailsId,
      this.imgUrl});

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

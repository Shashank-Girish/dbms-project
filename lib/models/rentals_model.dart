import 'package:json_annotation/json_annotation.dart';

part 'rentals_model.g.dart';

@JsonSerializable()
class Rental {
  int? id;
  int? userId;
  int? vehicleId;
  int? startLocationId;
  int? endLocationId;
  String? rentalStatus;
  int? numDays;
  int? distance;

  Rental(
      {this.id,
      this.userId,
      this.vehicleId,
      this.startLocationId,
      this.endLocationId,
      this.rentalStatus,
      this.numDays,
      this.distance});

  factory Rental.fromJson(Map<String, dynamic> json) => _$RentalFromJson(json);
  Map<String, dynamic> toJson() => _$RentalToJson(this);
}

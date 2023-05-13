import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class Location {
  int? id;
  double? latitude;
  double? longitude;
  String? name;
  String? address;
  String? zipcode;
  int? numVehicles;

  Location({
    this.id,
    this.latitude,
    this.longitude,
    this.name,
    this.address,
    this.zipcode,
    this.numVehicles
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
  

}

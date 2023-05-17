import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/vehicle_model.dart';

class VehicleRemoteDatasource{
  Future<void> addVehicleDetails(Vehicle vehicle) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicle/add_vehicle.php');
    var val = vehicle.toJson();
    print(val);
    var response = await http.post(uri, body: json.encode(val));
    print(response.body);
  }

  Future<List<Vehicle>> getVehicleDetails() {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicle/vehicle_info.php');
    print(uri.toString());
    return http.get(uri).then((response) {
      var val = json.decode(response.body);
      print(val['data'][0]);
      List<Vehicle> vehicle = [];
      for (var i = 0; i < val['data'].length; i++) {
        vehicle.add(Vehicle.fromJson(val['data'][i]));
      }
      return vehicle;
    });
  }

  Future<void> deleteVehicleDetails(String vid) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicle/delete_vehicle_detail.php');
    var val = {'vid': vid};
    print(val);
    var response = await http.post(uri, body: json.encode(val));
    print(response.body);
  }

  Future<void> updateVehicleDetails(Vehicle vehicle) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicle/update_vehicle_info.php', {'vid': vehicle.id});
    var val = vehicle.toJson();
    print(val);
    var response = await http.post(uri, body: json.encode(val));
    print(response.body);
  }

  Future<void> deleteVehicle(int vid) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicle/delete_vehicle.php', {'vid': vid.toString()});
    var response = await http.get(uri);
    print(response.body);
  }

  Future<Vehicle> getVehicle(int vid) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicle/vehicle_info_particular.php', {'vid': vid.toString()});
    var response = await http.get(uri);
    var val = json.decode(response.body);
    print(val['data'][0]);
    Vehicle vehicle = Vehicle.fromJson(val['data'][0]);
    return vehicle;
  }
}
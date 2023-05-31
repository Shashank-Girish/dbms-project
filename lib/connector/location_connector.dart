import 'dart:convert';

import 'package:vehicle_rental/core/widgets/messages.dart';
import 'package:vehicle_rental/models/location_model.dart';
import 'package:http/http.dart' as http;

class LocationRemoteDatasource {
  Future<void> createLocation(Location location) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/locations/create_location.php');

    var val = location.toJson();
    print(val);
    var response = await http.post(uri, body: json.encode(val));

    print(response.body);
  }

  Future<void> updateLocation(Location location) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/locations/update_location.php', {
      'lid': [location.id.toString()]
    });

    var val = location.toJson();
    var response = await http.post(uri, body: json.encode(val));

    print(response.body);
  }

  Future<void> deleteLocation(int lid) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/locations/delete_location.php', {
      'lid': [lid.toString()]
    });

    var response = await http.get(uri);

    print(response.body);
  }

  static Future<Map<String, dynamic>> getAllLocations() async {
    try {
      var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
          '/locations/get_all_locations.php');

      var response = await http.post(uri);
      var body = json.decode(response.body);

      if (body["success"] == true) {
        return {
          "success": true,
          "data": body["data"].map((e) => Location.fromJson(e)).toList()
        };
      } else {
        return {"success": false, "error": body["error"]};
      }
    } catch (e) {
      return {"success": false, "error": kSomethingWentWrongMessage};
    }
  }

  static Future<Map<String, dynamic>> getLocationDetails(
      {String? locationName, int? id}) async {
    try {
      var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
          'locations/location_details.php', {"location_name": locationName, "id": id.toString()});

      var response = await http.post(uri);
      var body = json.decode(response.body);

      if (body["success"] == true) {
        return {
          "success": true,
          "data": Location.fromJson(body["data"])
        };
      } else {
        return {"success": false, "error": body["error"]};
      }
    } catch (e) {
      return {"success": false, "error": kSomethingWentWrongMessage};
    }
  }
}

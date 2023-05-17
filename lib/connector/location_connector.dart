import 'dart:convert';

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
}


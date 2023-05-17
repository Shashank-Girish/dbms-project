import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/vehicle_type_model.dart';

class VehicleTypeRemoteDatasource {
  Future<void> addVehicleTypeDetails(VehicleType type) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicletypedetails/admin_add_vehicle.php');
    var val = type.toJson();
    print(val);
    var response = await http.post(uri, body: json.encode(val));
    print(response.body);
  }

  Future<List<VehicleType>> getVehicleDetails() {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicletypedetails/get_vehicle_details.php');
    print(uri.toString());
    return http.get(uri).then((response) {
      var val = json.decode(response.body);
      print(val['data'][0]);
      List<VehicleType> type = [];
      for (var i = 0; i < val['data'].length; i++) {
        type.add(VehicleType.fromJson(val['data'][i]));
      }
      return type;
    });
  }

  Future<void> deleteVehicleTypeDetails(String vdid) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicletypedetails/delete_vehicle_detail.php');
    var val = {'vdid': vdid};
    print(val);
    var response = await http.post(uri, body: json.encode(val));
    print(response.body);
  }

  Future<void> updateVehicleTypeDetails(VehicleType type) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/vehicletypedetails/update_vehicle_details.php', {'vdid': type.id});
    var val = type.toJson();
    print(val);
    var response = await http.post(uri, body: json.encode(val));
    print(response.body);
  }
}

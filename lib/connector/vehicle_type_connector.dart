import 'package:http/http.dart' as http;
import 'package:vehicle_rental/core/widgets/messages.dart';
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

  static Future<Map<String, dynamic>> getVehiclesDetails(
      List<int> vehicleTypeIds) async {
    try {
      List<VehicleType> details = [];
      for (final id in vehicleTypeIds) {
        var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
            '/vehicletypedetails/get_vehicle_details.php', {
          "vtypeid": id.toString(),
        });

        var response = await http.get(uri);
        var body = json.decode(response.body);
        if (body["success"] == true) {
          details.add(VehicleType.fromJson(body["data"]));
        } else {
          return {"success": false, "error": body["error"]};
        }
      }

      return {"success": true, "data": details};

    } catch (e) {
      return {"success": false, "error": kSomethingWentWrongMessage};
    }
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

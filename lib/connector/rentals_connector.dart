import 'package:http/http.dart' as http;
import 'package:vehicle_rental/core/widgets/messages.dart';
import 'dart:convert';
import '../models/rentals_model.dart';

class RentalsRemoteDatasource{
  static Future<Map<String, dynamic>> createRental(Rental rental) async {
    try {
      var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/rentals/create_rental.php');

      var val = rental.toJson();
      var response = await http.post(uri, body: json.encode(val));
      var body = json.decode(response.body);

      if (body["success"] == true) {
        return {
          "success": true,
        };
      } else {
        return {"success": false, "error": body["error"]};
      }
    } catch (e) {
      return {"success": false, "error": kSomethingWentWrongMessage};
    }
  }

  static Future<Map<String, dynamic>> userRentalInfo(int uid) async{
    try {
      var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/rentals/user_rental_info.php', {'uid': uid.toString()});

      var response = await http.get(uri);
      var body = json.decode(response.body);

      if (body["success"] == true) {
        return {
          "success": true,
          "data": body["data"].map((e) => Rental.fromJson(e)).toList()
        };
      } else {
        return {"success": false, "error": body["error"]};
      }
    } catch (e) {
      return {"success": false, "error": kSomethingWentWrongMessage};
    }
  }

  Future<List<Rental>> getRentalDetails() {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/rentals/admin_rental_info.php');
    print(uri.toString());
    return http.get(uri).then((response) {
      var val = json.decode(response.body);
      print(val['data'][0]);
      List<Rental> rental = [];
      for (var i = 0; i < val['data'].length; i++) {
        rental.add(Rental.fromJson(val['data'][i]));
      }
      return rental;
    });
  }

  Future<void> adminUpdateStatus(int id) async{
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/rentals/admin_update_status.php', {'id': id.toString()});
    print(uri.toString());
    var response=await http.get(uri);
    print(response.body);

  }

  Future<void> cancelUpdate(int id) async{
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/rentals/cancel_update.php', {'id': id.toString()});
    print(uri.toString());
    var response=await http.get(uri);
    print(response.body);

  }
}
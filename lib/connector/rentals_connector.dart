import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/rentals_model.dart';

class RentalsRemoteDatasource{
  Future<void> createRental(Rental rental) async {
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/rentals/create_rental.php');
    var val = rental.toJson();
    print(val);
    var response = await http.post(uri, body: json.encode(val));
    print(response.body);
  }

  Future<Rental> userRentalInfo(int uid){
    var uri = Uri.https("dbsvehiclerentalsystem.000webhostapp.com",
        '/rentals/user_rental_info.php', {'uid': uid.toString()});
    print(uri.toString());
    return http.get(uri).then((response) {
      var val = json.decode(response.body);
      print(val['data'][0]);
      Rental rental = Rental.fromJson(val['data'][0]);
      return rental;
    });
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
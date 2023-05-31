import 'package:flutter/material.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/features/dashboard/dashboard_page.dart';
import 'package:vehicle_rental/features/login/login_page.dart';
import 'package:vehicle_rental/features/rent_vehicle/view_vehicles.dart';
import 'package:vehicle_rental/models/user_model.dart';

User user = User(
  id: 37,
  name: "Anirudh V Gubbi",
  phoneNumber: "9123456780",
  age: 20,
  gender: "M",
  emailId: "anirudhvgubbi@gmail.com",
  address: "NITK, Surathkal",
  zipcode: "565725",
  licenseId: "KA15SCAMFAKE100",
  password: "dbmsftw!123",
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor 4 Road',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: kBackgroundColor),
      debugShowCheckedModeBanner: false,
      home: DashboardPage(user: user,)
    );
  }
}

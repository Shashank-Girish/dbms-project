import 'package:flutter/material.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/features/dashboard/widgets/about_us.dart';
import 'package:vehicle_rental/features/dashboard/dashboard_page.dart';
import 'package:vehicle_rental/features/login/login_page.dart';
import 'package:vehicle_rental/models/user_model.dart';

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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage()
    );
  }
}
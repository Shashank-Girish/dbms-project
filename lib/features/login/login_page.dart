import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/features/login/widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: kLinearGradientColors)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Transform.rotate(
                            angle: -pi / 30,
                            child: const Text(
                              "Motor 4 Road",
                              style: TextStyle(
                                fontSize: 80,
                                fontFamily: 'Neonderthaw',
                                color: Color.fromRGBO(115, 241, 158, 1),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/car.png",
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: LoginWidget()
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vehicle_rental/core/colors.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: kBackgroundColor,
      child: Column(children: [
        const Text(
          "\nWhat services we offer",
          style: TextStyle(
              fontSize: 40,
              color: Colors.greenAccent,
              fontFamily: "Neonderthaw"),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              10, 2, MediaQuery.of(context).size.width / 2, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "Inter City Rentals",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                    fontFamily: "BrushScript"),
              ),
              Text(
                """We provide inter city car and bike rentals
for your day to day city commutes and other needs.
We also provide specials cars for special occasions.""",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 2, 2, 10, 0),
          child: Column(
            children: const [
              Text("\nIntra City Rentals",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue,
                      fontFamily: "BrushScript")),
              Text("""Specifically for your trips and vacations,
we provide rentals for city to city travel with 
seasoned cars to enhance and make your trip memorable.""",
                  style: TextStyle(fontSize: 25)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              10, 2, MediaQuery.of(context).size.width / 2, 0),
          child: Column(
            children: const [
              Text("\nAirport Rentals",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue,
                      fontFamily: "BrushScript")),
              Text("""We provide rentals for airport pickups and dropoffs
to make your travel experience seamless and stress free.""",
                  style: TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ]),
    );
  }
}

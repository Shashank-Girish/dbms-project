import 'package:flutter/material.dart';
import 'package:vehicle_rental/core/widgets/fake_ui.dart'
    if (dart.library.html) 'package:vehicle_rental/core/widgets/real_ui.dart'
    as ui;
import 'dart:html';
import 'package:vehicle_rental/models/vehicle_model.dart';
import 'package:vehicle_rental/models/vehicle_type_model.dart';

class VehicleDisplayCard extends StatelessWidget {
  VehicleDisplayCard({Key? key, required this.vehicle, required this.vehicleDetails, required this.distance}) : super(key: key);

  final Vehicle vehicle;
  final VehicleType vehicleDetails;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return ProductDetailsPage(
          //       product: widget.product, blocContext: widget.blocContext);
          // }));
        },
        child: LayoutBuilder(
          builder: (context, constraints) => Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: constraints.maxHeight * 0.55,
                        child: image(),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0, top: 6.0),
                          child: Container(
                            decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.0)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: Text(vehicle.vehicleStatus!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            vehicleDetails.name!,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                wordSpacing: 0.8,
                                height: 1.2),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "₹ ${(vehicleDetails.price! * distance).toInt()}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget image() {
    ui.platformViewRegistry.registerViewFactory(
      vehicle.imgUrl!,
      (int _) => ImageElement()..src = vehicle.imgUrl,
    );

    return HtmlElementView(
      viewType: vehicle.imgUrl!,
    );
  }
}

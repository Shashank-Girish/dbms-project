import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vehicle_rental/connector/rentals_connector.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/widgets/fake_ui.dart'
    if (dart.library.html) 'package:vehicle_rental/core/widgets/real_ui.dart'
    as ui;
import 'package:vehicle_rental/core/widgets/messages.dart';
import 'package:vehicle_rental/core/widgets/solid_text_button.dart';
import 'package:vehicle_rental/models/location_model.dart';
import 'package:vehicle_rental/models/rentals_model.dart';
import 'package:vehicle_rental/models/user_model.dart';
import 'dart:html';
import 'package:vehicle_rental/models/vehicle_model.dart';
import 'package:vehicle_rental/models/vehicle_type_model.dart';

class VehicleDisplayCard extends StatefulWidget {
  VehicleDisplayCard({
    Key? key,
    required this.vehicle,
    required this.vehicleDetails,
    required this.distance,
    required this.userId,
    required this.startLocationId,
    required this.endLocationId,
    required this.numDays,
  }) : super(key: key);

  final Vehicle vehicle;
  final VehicleType vehicleDetails;
  final int userId;
  final int startLocationId;
  final int endLocationId;
  final int numDays;
  final double distance;

  @override
  State<VehicleDisplayCard> createState() => _VehicleDisplayCardState();
}

class _VehicleDisplayCardState extends State<VehicleDisplayCard> {
  final ValueNotifier<String?> errorMessage = ValueNotifier(null);
  final ValueNotifier<bool> submitting = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          showVehicleDetailsDialog(context);
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
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Text(widget.vehicle.vehicleStatus!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            widget.vehicleDetails.name!,
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
                              "₹ ${(widget.vehicleDetails.price! * widget.distance).toInt()}",
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
      widget.vehicle.imgUrl!,
      (int _) => ImageElement()..src = widget.vehicle.imgUrl,
    );

    return HtmlElementView(
      viewType: widget.vehicle.imgUrl!,
    );
  }

  void showVehicleDetailsDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
              child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.32,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.2,
                          child: image(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Center(
                          child: Text(
                            "${widget.vehicleDetails.name!} - ${widget.vehicleDetails.model!}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            titleCard(
                                "Mileage",
                                widget.vehicleDetails.mileage!.toString() +
                                    " Km/L"),
                            titleCard("    Age   ",
                                widget.vehicle.age!.toString() + " Yrs"),
                            titleCard(
                                "Run",
                                widget.vehicle.odometerReading!.toString() +
                                    " Kms")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                        child: Text(
                          "\u2022  " + widget.vehicle.details!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: ValueListenableBuilder(
                            valueListenable: submitting,
                            builder: (BuildContext context, bool value, _) {
                              return SolidTextButton(
                                onPressed: () async {
                                  if (submitting.value) return;
                                  errorMessage.value = null;

                                  RentalsRemoteDatasource.createRental(
                                    Rental(
                                      userId: widget.userId,
                                      vehicleId: widget.vehicle.id,
                                      startLocationId: widget.startLocationId,
                                      endLocationId: widget.endLocationId,
                                      rentalStatus: "Pending",
                                      numDays: widget.numDays,
                                      distance: widget.distance.toInt(),
                                    ),
                                  ).then((value) {
                                    submitting.value = false;
                                    if (value["success"] == true) {
                                      Navigator.of(context).pop();
                                    } else {
                                      errorMessage.value =
                                          "Could not process the rental";
                                    }
                                  });

                                  submitting.value = true;
                                },
                                isLoading: value,
                                text: "Rent Vehicle",
                                buttonColor: kBlueButtonColor,
                              );
                            }),
                      ),
                      ValueListenableBuilder(
                          valueListenable: errorMessage,
                          builder: (BuildContext context, String? value, _) {
                            return value != null
                                ? Center(
                                    child: Text(
                                      value!,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  )
                                : Container();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ));
        });
  }

  Widget titleCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

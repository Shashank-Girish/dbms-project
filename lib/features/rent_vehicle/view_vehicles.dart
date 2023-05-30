import 'package:flutter/material.dart';
import 'package:vehicle_rental/connector/location_connector.dart';
import 'package:vehicle_rental/connector/vehicle_connector.dart';
import 'package:vehicle_rental/connector/vehicle_type_connector.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/computations.dart';
import 'package:vehicle_rental/core/widgets/messages.dart';
import 'package:vehicle_rental/features/rent_vehicle/widgets/step_location_marker.dart';
import 'package:vehicle_rental/features/rent_vehicle/widgets/vehicle_display_card.dart';
import 'package:vehicle_rental/models/vehicle_model.dart';

class ViewVehicles extends StatefulWidget {
  const ViewVehicles({Key? key, required this.filters}) : super(key: key);

  final Map<String, dynamic> filters;

  @override
  State<ViewVehicles> createState() => _ViewVehiclesState();
}

class _ViewVehiclesState extends State<ViewVehicles> {
  late Future<Map<String, dynamic>> filteredVehiclesFuture;
  late Future<Map<String, dynamic>> startLocationDetailsFuture;
  late Future<Map<String, dynamic>> endLocationDetailsFuture;
  double? distance;
  List<Vehicle> vehicles = [];

  @override
  void initState() {
    super.initState();
    filteredVehiclesFuture =
        VehicleRemoteDatasource.getFilteredVehicles(widget.filters);
    startLocationDetailsFuture = LocationRemoteDatasource.getLocationDetails(
        widget.filters["start_location"]);
    endLocationDetailsFuture = LocationRemoteDatasource.getLocationDetails(
        widget.filters["end_location"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        child: FutureBuilder(
            future: Future.wait([
              filteredVehiclesFuture,
              startLocationDetailsFuture,
              endLocationDetailsFuture,
            ]),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError ||
                  (snapshot.hasData && !snapshot.data![0]["success"]) ||
                  (snapshot.hasData && !snapshot.data![1]["success"]) ||
                  (snapshot.hasData && !snapshot.data![2]["success"])) {
                return const Center(child: Text(kSomethingWentWrongMessage));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              distance ??= locDistance(
                  snapshot.data![1]["data"].latitude!,
                  snapshot.data![1]["data"].longitude!,
                  snapshot.data![2]["data"].latitude!,
                  snapshot.data![2]["data"].longitude!);
              vehicles = snapshot.data![0]["data"]
                  .map<Vehicle>((e) => e as Vehicle)
                  .toList();

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: kDashboardLinearGradientColors)),
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "${widget.filters["type"]} Rentals",
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
                    child: StepLocationMarker(
                      steps: [
                        snapshot.data![1]["data"].address!,
                        snapshot.data![2]["data"].address!
                      ],
                      distance: distance!,
                    ),
                  ),
                  vehicles.isEmpty
                      ? const Expanded(
                          child: Center(
                              child: Text(
                            kNoCarsAtLocation,
                            style: TextStyle(fontSize: 20),
                          )),
                        )
                      : FutureBuilder(
                          future: getVehicleDetails(snapshot.data![0]["data"]),
                          builder: (BuildContext context,
                              AsyncSnapshot<Map<String, dynamic>>
                                  nextSnapshot) {
                            if (nextSnapshot.hasError ||
                                (nextSnapshot.hasData &&
                                    !nextSnapshot.data!["success"])) {
                              return const Center(
                                  child: Text(kSomethingWentWrongMessage));
                            }

                            if (nextSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: GridView.count(
                                  shrinkWrap: true,
                                  addAutomaticKeepAlives: true,
                                  padding: const EdgeInsets.all(2.0),
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 10.0,
                                  crossAxisCount: 6,
                                  children: [
                                    for (int i = 0; i < vehicles.length; i++) ...{
                                      VehicleDisplayCard(
                                          vehicle: vehicles[i],
                                          vehicleDetails:
                                              nextSnapshot.data!["data"][i],
                                          distance: distance!),
                                    }
                                  ]),
                            );
                          },
                        )
                ],
              );
            }),
      ),
    );
  }

  Future<Map<String, dynamic>> getVehicleDetails(List vehicles) async {
    List<int> vids = vehicles.map<int>((e) => e.vehicleTypeDetailsId!).toList();
    return (await VehicleTypeRemoteDatasource.getVehiclesDetails(vids));
  }
}

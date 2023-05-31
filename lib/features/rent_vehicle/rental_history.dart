import 'package:flutter/material.dart';
import 'package:vehicle_rental/connector/location_connector.dart';
import 'package:vehicle_rental/connector/rentals_connector.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/widgets/messages.dart';
import 'package:vehicle_rental/models/rentals_model.dart';

class RentalHistory extends StatefulWidget {
  const RentalHistory({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  State<RentalHistory> createState() => _RentalHistoryState();
}

class _RentalHistoryState extends State<RentalHistory> {
  late Future<Map<String, dynamic>> rentalFuture;

  @override
  void initState() {
    super.initState();
    rentalFuture = RentalsRemoteDatasource.userRentalInfo(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.1),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: kDashboardLinearGradientColors),
          ),
          child: const Center(
            child: Text(
              "My Rental History",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
                future: rentalFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.hasError ||
                      (snapshot.hasData && !snapshot.data!["success"])) {
                    return const Center(
                        child: Text(kSomethingWentWrongMessage));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 28.0, horizontal: 28),
                    child: Container(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[600]),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!["data"].length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data!["data"][index] as Rental;
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 20.0),
                                      child: Text((index + 1).toString() + "."),
                                    ),
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                    FutureBuilder(
                                        future: LocationRemoteDatasource
                                            .getLocationDetails(
                                                id: snapshot
                                                    .data!["data"][index]
                                                    .startLocationId),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<Map<String, dynamic>>
                                                s1) {
                                          if (s1.hasError ||
                                              (s1.hasData &&
                                                  !s1.data!["success"])) {
                                            return const Center(
                                                child: Text(
                                                    kSomethingWentWrongMessage));
                                          }

                                          if (s1.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          return Text(s1.data!["data"].address);
                                        }),
                                  ],
                                ),
                                const Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Text("TO"),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    FutureBuilder(
                                        future: LocationRemoteDatasource
                                            .getLocationDetails(
                                                id: snapshot
                                                    .data!["data"][index]
                                                    .endLocationId),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<Map<String, dynamic>>
                                                s1) {
                                          if (s1.hasError ||
                                              (s1.hasData &&
                                                  !s1.data!["success"])) {
                                            return const Center(
                                                child: Text(
                                                    kSomethingWentWrongMessage));
                                          }

                                          if (s1.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          return Text(s1.data!["data"].address);
                                        }),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: item.rentalStatus == "Pending"
                                            ? Colors.deepOrange
                                            : item.rentalStatus == "Approved"
                                                ? Colors.green
                                                : Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Text(item.rentalStatus!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

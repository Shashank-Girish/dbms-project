import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/retry.dart';
import 'package:vehicle_rental/connector/location_connector.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/widgets/input_text_field.dart';
import 'package:vehicle_rental/core/widgets/messages.dart';
import 'package:vehicle_rental/core/widgets/solid_text_button.dart';
import 'package:vehicle_rental/core/widgets/tab_button.dart';
import 'package:vehicle_rental/features/rent_vehicle/view_vehicles.dart';
import 'package:vehicle_rental/models/location_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ValueNotifier<int> selectedTab = ValueNotifier(0);
  List<ValueNotifier<String?>> selectedLocations = [
    ValueNotifier(null),
    ValueNotifier(null)
  ];
  List<ValueNotifier<DateTime?>> selectedDate = [
    ValueNotifier(null),
    ValueNotifier(null)
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 54.0),
                            child: Text(
                              "High Service\nFor Every\nCustomer!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 60),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SolidTextButton(
                            text: "Leave us a Review",
                            buttonColor: kBlueButtonColor,
                            onPressed: () {
                              var review = TextEditingController();
                              var alert = StatefulBuilder(
                                  builder: ((context, setState) {
                                return AlertDialog(
                                  title: const Text("Leave a Review"),
                                  content: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      children: [
                                        InputTextField(
                                          maxLines: 9,
                                          maxLength: 256,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          textEditingController: review,
                                          validator: (value) {
                                            return (value == null ||
                                                value.isEmpty);
                                          },
                                          hintText: "Enter your review here",
                                          validatorMessage:
                                              "Please enter a review",
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SolidTextButton(
                                          text: "Submit",
                                          buttonColor: kBlueButtonColor,
                                          onPressed: () {
                                            if (review.text.isNotEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: const Text(
                                                          "Review Submitted")));
                                              Navigator.pop(context);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: const Text(
                                                          "Please enter a review")));
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }));
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  });
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 180,
                      child: Image.asset(
                        "assets/map_bg.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 288),
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: kDashboardLinearGradientColors)),
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 160),
                child: searchVehicleTabs(),
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          right: MediaQuery.of(context).size.width * 0.0,
          child: IgnorePointer(
            child: SizedBox(
              height: 600,
              width: 600,
              child: Image.asset(
                "assets/car_model.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget searchVehicleTabs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
            valueListenable: selectedTab,
            builder: (context, value, _) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabButton(
                      label: "4-Wheelers",
                      onPressed: () {
                        if (value != 0) {
                          selectedTab.value = 0;
                        }
                      },
                      isSelected: value == 0,
                    ),
                    TabButton(
                      label: "2-Wheelers",
                      onPressed: () {
                        if (value != 1) {
                          selectedTab.value = 1;
                        }
                      },
                      isSelected: value == 1,
                    )
                  ],
                ),
              );
            }),
        ValueListenableBuilder(
            valueListenable: selectedTab,
            builder: (context, value, _) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: const BoxDecoration(color: kTabButtonColorActive),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: selectedLocations[0],
                            builder: (BuildContext context, String? value, _) {
                              return markerWidget("Pick Up Location", value,
                                  Icons.location_on_outlined, 0);
                            }),
                        const Spacer(),
                        ValueListenableBuilder(
                            valueListenable: selectedLocations[1],
                            builder: (BuildContext context, String? value, _) {
                              return markerWidget("Drop Off Location", value,
                                  Icons.location_on_outlined, 1);
                            }),
                        const Spacer(),
                        ValueListenableBuilder(
                            valueListenable: selectedDate[0],
                            builder:
                                (BuildContext context, DateTime? value, _) {
                              return markerWidget(
                                  "Pick Up Date",
                                  value?.toString().split(" ")[0],
                                  Icons.date_range_outlined,
                                  2);
                            }),
                        const Spacer(),
                        ValueListenableBuilder(
                            valueListenable: selectedDate[1],
                            builder:
                                (BuildContext context, DateTime? value, _) {
                              return markerWidget(
                                  "Drop Off Date",
                                  value?.toString().split(" ")[0],
                                  Icons.date_range_outlined,
                                  3);
                            }),
                        const Spacer(),
                        SolidTextButton(
                          text: "Search Rentals",
                          buttonColor: kBlueButtonColor,
                          onPressed: () {
                            if (!validateDetails()) return;

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewVehicles(
                                filters: {
                                  "start_location": selectedLocations[0].value!,
                                  "end_location": selectedLocations[1].value!,
                                  "start_date": selectedDate[0].value!,
                                  "end_date": selectedDate[1].value!,
                                  "type":
                                      selectedTab.value == 0 ? "Car" : "Bike",
                                },
                              ),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }

  Widget markerWidget(String label, String? value, IconData icon, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        InkWell(
          onTap: () {
            if (index == 0 || index == 1) {
              showLocationDialog(context, index);
            } else if (index == 2 || index == 3) {
              showCalenderDialog(context, index % 2);
            }
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                ),
                Text(value ?? label.split(" ").last,
                    style: TextStyle(color: Colors.grey[800]))
              ],
            ),
          ),
        )
      ],
    );
  }

  void showLocationDialog(BuildContext context, int locationIndex) {
    showCupertinoDialog(
        barrierDismissible: true,
        useRootNavigator: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: const Text("Choose a Start Location"),
              content: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.6),
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: LocationRemoteDatasource.getAllLocations(),
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<String, dynamic>> snapshot) {
                      if (snapshot.hasError ||
                          (snapshot.hasData && !snapshot.data!["success"])) {
                        return const Text(kSomethingWentWrongMessage);
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Material(
                        color: Colors.transparent,
                        child: StatefulBuilder(builder: (context, setState) {
                          return Column(children: [
                            for (int i = 0;
                                i < snapshot.data!["data"].length;
                                i++) ...{
                              RadioListTile<String?>(
                                groupValue:
                                    selectedLocations[locationIndex].value,
                                value: snapshot.data!["data"][i].name,
                                onChanged: (value) {
                                  setState(() {
                                    selectedLocations[locationIndex].value =
                                        value;
                                  });
                                },
                                title: Text(
                                  snapshot.data!["data"][i].name,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              )
                            }
                          ]);
                        }),
                      );
                    },
                  ),
                ),
              ));
        });
  }

  void showCalenderDialog(BuildContext context, int dateIndex) async {
    selectedDate[dateIndex].value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
  }

  void showAlertDialog(BuildContext context, String message) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              "Invalid Details",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            content: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          );
        });
  }

  bool validateDetails() {
    if (selectedLocations[0].value == null) {
      showAlertDialog(context, "Please choose a Pick Up Location");
      return false;
    }

    if (selectedLocations[1].value == null) {
      showAlertDialog(context, "Please choose a Drop Off Location");
      return false;
    }

    if (selectedLocations[0].value == selectedLocations[1].value) {
      showAlertDialog(context, "Please choose distinct locations");
      return false;
    }

    if (selectedDate[0].value == null) {
      showAlertDialog(context, "Please choose a Pick Up Date");
      return false;
    }

    if (selectedDate[1].value == null) {
      showAlertDialog(context, "Please choose a Drop Off Date");
      return false;
    }

    if (selectedDate[0].value!.isAfter(selectedDate[1].value!)) {
      showAlertDialog(context, "Drop Off Date cannot be before Pick Up Date");
      return false;
    }

    return true;
  }
}

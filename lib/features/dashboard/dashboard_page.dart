import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/widgets/solid_text_button.dart';
import 'package:vehicle_rental/core/widgets/tab_button.dart';
import 'package:vehicle_rental/models/user_model.dart';

const tabs = ["Home", "Services", "About Us", "Log Out"];

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ValueNotifier<int> indicatorIndex = ValueNotifier(0);
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  ValueNotifier<int> selectedTab = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Motor 4 Road",
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Neonderthaw',
                color: Color.fromRGBO(115, 241, 158, 1),
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < tabs.length; i++) ...{
                  InkWell(
                    child: ValueListenableBuilder(
                        valueListenable: indicatorIndex,
                        builder: (context, value, _) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  tabs[i],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: indicatorIndex.value == i,
                                  child: Container(
                                    height: 2,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                    onTap: () {
                      indicatorIndex.value = i;
                      selectedIndex.value = i;
                    },
                    onHover: (value) {
                      if (value) {
                        indicatorIndex.value = i;
                      } else {
                        indicatorIndex.value = selectedIndex.value;
                      }
                    },
                  )
                }
              ],
            )
          ],
        ),
      ),
      body: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              homeTab(context),
              servicesTab(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeTab(BuildContext context) {
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
                            onPressed: () {},
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
          child: SizedBox(
            height: 600,
            width: 600,
            child: Image.asset(
              "assets/car_model.png",
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }

  Widget servicesTab(BuildContext context) {
    return Container(
      height: 600,
      color: kBackgroundColor,
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
                        markerWidget(
                          "Pick Up Location",
                          Icons.location_on_outlined,
                        ),
                        const Spacer(),
                        markerWidget(
                          "Drop Off Location",
                          Icons.location_on_outlined,
                        ),
                        const Spacer(),
                        markerWidget("Pick Up Date", Icons.date_range_outlined),
                        const Spacer(),
                        if(value == 0) ...{
                          markerWidget("Number of Seats", Icons.car_rental_outlined),
                          const Spacer(),
                        },
                        SolidTextButton(
                          text: "Search Rentals",
                          buttonColor: kBlueButtonColor,
                          onPressed: () {},
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

  Widget markerWidget(String label, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Text(label.split(" ").last, style: TextStyle(color: Colors.grey[800]))
          ],
        )
      ],
    );
  }
}

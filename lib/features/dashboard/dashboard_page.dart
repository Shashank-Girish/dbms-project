import 'package:flutter/material.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/features/dashboard/widgets/about_us.dart';
import 'package:vehicle_rental/features/dashboard/widgets/home_tab.dart';
import 'package:vehicle_rental/features/dashboard/widgets/profile.dart';
import 'package:vehicle_rental/features/dashboard/widgets/services_tab.dart';
import 'package:vehicle_rental/features/login/login_page.dart';
import 'package:vehicle_rental/models/user_model.dart';

const tabs = ["Home", "Services", "About Us", "Profile"];
var keys = [GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey()];

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ValueNotifier<int> indicatorIndex = ValueNotifier(0);
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

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
                      Scrollable.ensureVisible(keys[i].currentContext!);
                    },
                    onHover: (value) {
                      if (value) {
                        indicatorIndex.value = i;
                      } else {
                        indicatorIndex.value = selectedIndex.value;
                      }
                    },
                  )
                },
                LogOut()
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
              HomeTab(
                key: keys[0],
                user: widget.user,
              ),
              ServicesTab(
                key: keys[1],
              ),
              AboutUs(
                key: keys[2],
              ),
              UserProfileWidget(
                user: widget.user,
                key: keys[3],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    var alert = AlertDialog(
      title: const Text("Log Out"),
      content: const Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: const Text("Yes"),
        ),
      ],
    );
    return Container(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              });
        },
        child: const Text("Log Out"),
      ),
    );
  }
}

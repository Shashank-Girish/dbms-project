import 'package:flutter/material.dart';
import 'package:vehicle_rental/connector/user_connector.dart';
import 'package:vehicle_rental/core/widgets/solid_text_button.dart';
import 'package:vehicle_rental/models/user_model.dart';

class UserProfileWidget extends StatefulWidget {
  final User user;

  UserProfileWidget({required this.user});

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  String dropdownValue = 'Male';
  var name = TextEditingController();
  var age = TextEditingController();
  var phoneNumber = TextEditingController();
  var emailId = TextEditingController();
  var address = TextEditingController();
  var zipcode = TextEditingController();
  var licenseId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8.0),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      'Name: ${widget.user.name}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.phone),
                    Text(
                      'Phone Number: ${widget.user.phoneNumber}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    Text(
                      'Age: ${widget.user.age}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.wc),
                    Text(
                      'Gender: ${widget.user.gender}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8.0),
            child: Column(
              children: [
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.email),
                    Text(
                      'Email ID: ${widget.user.emailId}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.home),
                    Text(
                      'Address: ${widget.user.address}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.home),
                    Text(
                      'Zip Code: ${widget.user.zipcode}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.car_repair),
                    Text(
                      'License ID: ${widget.user.licenseId}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SolidTextButton(
              onPressed: () {
                setState(() {
                  name = TextEditingController(text: widget.user.name);
                  age = TextEditingController(text: widget.user.age.toString());
                  phoneNumber =
                      TextEditingController(text: widget.user.phoneNumber);
                  emailId = TextEditingController(text: widget.user.emailId);
                  address = TextEditingController(text: widget.user.address);
                  zipcode = TextEditingController(
                      text: widget.user.zipcode.toString());
                  licenseId =
                      TextEditingController(text: widget.user.licenseId);

                  var alert = StatefulBuilder(
                      builder: ((context, setState) => AlertDialog(
                            scrollable: true,
                            title: Text("Edit Personal Info"),
                            content: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 16.0),
                                            Row(
                                              children: [
                                                Icon(Icons.person),
                                                Text(
                                                  'Name: ',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: name,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter Name',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Icon(Icons.phone),
                                                Text(
                                                  'Phone Number: ',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: phoneNumber,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Enter Phone Number',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_today),
                                                Text(
                                                  'Age: ',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: age,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter Age',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Icon(Icons.wc),
                                                Text(
                                                  'Gender: ',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child:
                                                      DropdownButtonFormField<
                                                          String>(
                                                    value: dropdownValue,
                                                    decoration: InputDecoration(
                                                      labelText: 'Gender',
                                                    ),
                                                    items: [
                                                      'Male',
                                                      'Female',
                                                      'Other'
                                                    ]
                                                        .map((String value) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            ))
                                                        .toList(),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropdownValue =
                                                            newValue!;
                                                        widget.user.gender =
                                                            newValue; // Update the user's gender
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Icon(Icons.email),
                                                Text(
                                                  'Email ID: ${widget.user.emailId}',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Icon(Icons.home),
                                                Text(
                                                  'Address:',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: address,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter Address',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Icon(Icons.home),
                                                Text(
                                                  'Zip Code: ',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: zipcode,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Enter Zip Code',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.car_repair),
                                                Text(
                                                  'License ID: ',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: TextFormField(
                                                    controller: licenseId,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Enter License ID',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.user.id = widget.user.id;
                                        widget.user.name = name.text;
                                        widget.user.age = int.parse(age.text);
                                        widget.user.phoneNumber =
                                            phoneNumber.text;
                                        widget.user.emailId =
                                            widget.user.emailId;
                                        widget.user.address = address.text;
                                        widget.user.zipcode = (zipcode.text);
                                        widget.user.licenseId = licenseId.text;
                                        widget.user.password =
                                            widget.user.password;
                                      });
                                      UserRemoteDatasource()
                                          .updateUserDetails(widget.user);
                                      Navigator.pop(context);
                                    },
                                    child: Text("Save Changes"))
                              ],
                            ),
                          )));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                });
              },
              text: "Edit User Info")
        ],
      ),
    );
  }
}

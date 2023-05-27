import 'package:flutter/material.dart';
import 'package:vehicle_rental/connector/user_connector.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/widgets/input_text_field.dart';
import 'package:vehicle_rental/core/widgets/responsive.dart';
import 'package:vehicle_rental/core/widgets/solid_text_button.dart';
import 'package:vehicle_rental/features/dashboard/dashboard_page.dart';
import 'package:vehicle_rental/features/login/error_messages.dart';
import 'package:vehicle_rental/models/user_model.dart';

List<String> genders = ["Male", "Female", "Others"];

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key, required this.navigationCallback})
      : super(key: key);

  final Function navigationCallback;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ValueNotifier<bool> submitted = ValueNotifier<bool>(false);
  ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);
  ValueNotifier<int> stepNumber = ValueNotifier<int>(1);
  ValueNotifier<String?> gender = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: errorMessage,
          builder: (BuildContext context, String? value, _) {
            if (value != null) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  value,
                  style: const TextStyle(color: kLoginErrorColor),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        ValueListenableBuilder(
          valueListenable: stepNumber,
          builder: (BuildContext context, int value, _) {
            if (value == 1) {
              return step1();
            } else {
              return step2();
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account? "),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                  onTap: () {
                    // Navigate to Sign In page
                    widget.navigationCallback("Sign In");
                  },
                  child: const Text(
                    "Sign In!",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ValueListenableBuilder(
            valueListenable: stepNumber,
            builder: (BuildContext context, int value, _) {
              if (value == 1) {
                return button("Next", () {
                  if (!formKey1.currentState!.validate()) return;

                  stepNumber.value = 2;
                });
              } else {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button("Previous", () {
                        stepNumber.value = 1;
                      }),
                      button("Sign Up", (bool value) async {
                        if (value) return;
                        submitted.value = true;

                        if (!formKey2.currentState!.validate()) {
                          submitted.value = false;
                          return;
                        }

                        UserRemoteDatasource()
                            .signUp(User(
                          name: nameController.text,
                          emailId: emailController.text,
                          phoneNumber: phoneController.text,
                          address: addressController.text,
                          zipcode: zipcodeController.text,
                          licenseId: licenseController.text,
                          password: passwordController.text,
                          gender: gender.value![0],
                          age: int.parse(ageController.text),
                        ))
                            .then((Map<String, dynamic> response) {
                          if (response["success"] == true) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DashboardPage(user: response["data"])));
                            errorMessage.value = response["data"].name;
                          } else {
                            errorMessage.value =
                                handleErrorMessage(response["error"]);
                          }
                        });

                        submitted.value = false;
                      }, asynchronous: true)
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget button(String name, Function onPressed, {bool asynchronous = false}) {
    if (asynchronous) {
      return ValueListenableBuilder(
          valueListenable: submitted,
          builder: (BuildContext context, bool value, _) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SolidTextButton(
                  text: name,
                  isLoading: value,
                  onPressed: () => onPressed(value)),
            );
          });
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SolidTextButton(
            text: name, isLoading: false, onPressed: () => onPressed()),
      );
    }
  }

  Widget step1() {
    return Form(
      key: formKey1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: InputTextField(
              textEditingController: nameController,
              validator: (enteredText) {
                return enteredText!.trim().isEmpty;
              },
              errorColor: kLoginErrorColor,
              maxLength: 40,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "Name",
              validatorMessage: "Name cannot be empty",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: InputTextField(
              textEditingController: emailController,
              validator: (enteredText) {
                return enteredText!.trim().isEmpty;
              },
              errorColor: kLoginErrorColor,
              maxLength: 50,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "Email",
              validatorMessage: "Email ID cannot be empty",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
            child: InputTextField(
              textEditingController: addressController,
              validator: (enteredText) {
                return enteredText!.trim().isEmpty;
              },
              errorColor: kLoginErrorColor,
              maxLength: 150,
              maxLines: 3,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "Address",
              validatorMessage: "Address cannot be empty",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
            child: InputTextField(
              textEditingController: zipcodeController,
              validator: (enteredText) {
                return enteredText!.trim().length != 6 ||
                    int.tryParse(enteredText) == null;
              },
              keyboardType: TextInputType.number,
              errorColor: kLoginErrorColor,
              maxLength: 6,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "Zipcode",
              validatorMessage: "Zipcode must be exactly 6 digits",
            ),
          ),
        ],
      ),
    );
  }

  Widget step2() {
    return Form(
      key: formKey2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
            child: InputTextField(
              textEditingController: phoneController,
              validator: (enteredText) {
                return enteredText!.trim().length != 10 ||
                    int.tryParse(enteredText) == null;
              },
              keyboardType: TextInputType.number,
              errorColor: kLoginErrorColor,
              maxLength: 10,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "Phone No",
              validatorMessage: "Phone number must be exactly 10 digits",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputTextField(
                  textEditingController: ageController,
                  validator: (enteredText) {
                    return enteredText!.trim().isEmpty ||
                        int.tryParse(enteredText) == null ||
                        int.parse(enteredText) < 18 ||
                        int.parse(enteredText) > 127;
                  },
                  keyboardType: TextInputType.number,
                  errorColor: kLoginErrorColor,
                  maxLength: 4,
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * 0.12
                      : MediaQuery.of(context).size.width * 0.30,
                  hintText: "Age",
                  validatorMessage: "Enter a valid age",
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width * 0.03
                        : MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: SizedBox(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.width * 0.15
                        : MediaQuery.of(context).size.width * 0.45,
                    child: ValueListenableBuilder(
                        valueListenable: gender,
                        builder:
                            (BuildContext context, String? chosenValue, _) {
                          return DropdownButtonFormField(
                            value: chosenValue,
                            validator: (value) => value == null
                                ? 'You must choose a gender'
                                : null,
                            items: genders.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              gender.value = value as String?;
                            },
                            hint: const Text(
                              'Choose a gender',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            dropdownColor: kLinearGradientColors[0],
                            icon:
                                const Icon(Icons.keyboard_arrow_down_outlined),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: InputTextField(
              textEditingController: licenseController,
              validator: (enteredText) {
                return enteredText!.trim().length != 15;
              },
              errorColor: kLoginErrorColor,
              maxLength: 15,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "License ID",
              validatorMessage: "License ID must be exactly 15 characters",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
            child: InputTextField(
              textEditingController: passwordController,
              validator: (enteredText) {
                return enteredText!.trim().length < 8;
              },
              obscure: true,
              errorColor: kLoginErrorColor,
              maxLength: 20,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "Password",
              validatorMessage: "Password must be atleast 8 characters long",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
            child: InputTextField(
              textEditingController: confirmPasswordController,
              validator: (enteredText) {
                return enteredText!.trim() != passwordController.text;
              },
              obscure: true,
              errorColor: kLoginErrorColor,
              maxLength: 20,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.8,
              hintText: "Confirm Password",
              validatorMessage: "Passwords do not match",
            ),
          ),
        ],
      ),
    );
  }
}

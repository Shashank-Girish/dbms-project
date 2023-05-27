import 'package:flutter/material.dart';
import 'package:vehicle_rental/connector/user_connector.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/widgets/input_text_field.dart';
import 'package:vehicle_rental/core/widgets/responsive.dart';
import 'package:vehicle_rental/core/widgets/solid_text_button.dart';
import 'package:vehicle_rental/features/dashboard/dashboard_page.dart';
import 'package:vehicle_rental/features/login/error_messages.dart';
import 'package:vehicle_rental/models/user_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, required this.navigationCallback})
      : super(key: key);

  final Function navigationCallback;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> submitted = ValueNotifier<bool>(false);
  ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign In",
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
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
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
            padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? "),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      // Navigate to Sign Up page
                      widget.navigationCallback("Sign Up");
                    },
                    child: const Text(
                      "Sign Up!",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
          ValueListenableBuilder(
              valueListenable: submitted,
              builder: (BuildContext context, bool value, _) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 16.0),
                  child: SolidTextButton(
                    text: "Sign In",
                    isLoading: value,
                    onPressed: () async {
                      if (value) return;
                      submitted.value = true;

                      if (!formKey.currentState!.validate()) {
                        submitted.value = false;
                        return;
                      }

                      UserRemoteDatasource()
                          .signIn(User(
                              emailId: emailController.text,
                              password: passwordController.text))
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

                        submitted.value = false;
                      });
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}

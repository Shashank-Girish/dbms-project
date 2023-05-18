import 'package:flutter/material.dart';
import 'package:vehicle_rental/connector/user_connector.dart';
import 'package:vehicle_rental/core/colors.dart';
import 'package:vehicle_rental/core/widgets/input_text_field.dart';
import 'package:vehicle_rental/core/widgets/solid_text_button.dart';
import 'package:vehicle_rental/models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<bool> submitted = ValueNotifier<bool>(false);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<String?> userName = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: kLinearGradientColors)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/car.png",
                ),
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign In",
                        style:
                            TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
                          width: MediaQuery.of(context).size.width * 0.3,
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
                          errorColor: kLoginErrorColor,
                          maxLength: 20,
                          width: MediaQuery.of(context).size.width * 0.3,
                          hintText: "Password",
                          validatorMessage: "Password must be atleast 8 characters long",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? "
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to Sign Up page
                              },
                              child: const Text(
                                "Sign Up!",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                      ValueListenableBuilder(
                        valueListenable: submitted,
                        builder: (BuildContext context, bool value, _) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SolidTextButton(
                              text: "Sign In",
                              isLoading: value,
                              onPressed: () async {
                                if(value) return;
                                submitted.value = true;

                                if(!formKey.currentState!.validate()) {
                                  submitted.value = false;
                                  return;
                                }

                                User? user = await UserRemoteDatasource().signIn(User(
                                  emailId: emailController.text,
                                  password: passwordController.text
                                ));
                                submitted.value = false;
                                print(user?.name);
                                userName.value = user?.name;
                
                              },
                            ),
                          );
                        }
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ValueListenableBuilder(
                          valueListenable: userName,
                          builder: (BuildContext context, String? value, _) {
                            if(value != null) {
                              return Text(
                                "Hello $value"
                              );
                            }
                            else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

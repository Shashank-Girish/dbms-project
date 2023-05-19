import 'package:vehicle_rental/core/widgets/messages.dart';

String handleErrorMessage(String message) {
  if (message.contains("Incorrect")) {
    return "Email ID or Password is incorrect!";
  } else if (message.contains("email_id") && message.contains("Duplicate")) {
    return "Email ID already taken";
  } else {
    return kSomethingWentWrongMessage;
  }
}

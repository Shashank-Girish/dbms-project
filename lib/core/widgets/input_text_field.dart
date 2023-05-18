import 'package:flutter/material.dart' hide Router;

class InputTextField extends StatelessWidget {
  final int maxLines;
  final int maxLength;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final String validatorMessage;
  final bool Function(String?) validator;
  final Color errorColor;
  final double width;
  const InputTextField(
      {Key? key,
      this.maxLines = 1,
      this.hintText = '',
      required this.textEditingController,
      required this.width,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.validatorMessage = '',
      this.maxLength = 0,
      this.errorColor = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool autovalidate = false;
    return SizedBox(
      width: width,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        controller: textEditingController,
        maxLength: maxLength,
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          fillColor: Colors.black,
          hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.white
          ),
          errorStyle: TextStyle(
            color: errorColor,
            fontWeight: FontWeight.w600
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
                color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: errorColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: errorColor),
          ),
        ),
        textCapitalization: TextCapitalization.sentences,
        validator: (enteredText) {
          if (validator(enteredText) && autovalidate) {
            return validatorMessage;
          } else {
            autovalidate = true;
            return null;
          }
        },
        onChanged: (text) {
          autovalidate = true;
        },
      ),
    );
  }
}

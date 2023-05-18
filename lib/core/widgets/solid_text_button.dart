import 'package:flutter/material.dart' hide Router;
import 'package:vehicle_rental/core/colors.dart';

class SolidTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;

  const SolidTextButton({Key? key, required this.text, required this.onPressed, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(kLinearGradientColors[0]),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(isLoading)
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 16.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}

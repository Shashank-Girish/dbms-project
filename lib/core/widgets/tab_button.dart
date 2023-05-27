import 'package:flutter/material.dart' hide Router;
import 'package:vehicle_rental/core/colors.dart';

class TabButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isSelected;

  const TabButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all<Color>(kTabButtonColorActive)
            : MaterialStateProperty.all<Color>(kTabButtonColorInactive),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}

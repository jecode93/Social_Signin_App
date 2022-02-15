import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.labelText,
    required this.buttonColor,
    required this.onPressed,
    required this.textColor,
    this.imagePath,
  }) : super(key: key);

  final Color textColor;
  final Color buttonColor;
  final String labelText;
  final String? imagePath;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50.0,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          ),
          onPressed: onPressed,
          icon: Image.asset(imagePath!),
          label: Text(
            labelText,
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

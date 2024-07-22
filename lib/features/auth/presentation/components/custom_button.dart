import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final Function() onPressed;
  const CustomButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)
        ),
        backgroundColor: const Color(0xFF000000)
      ),
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          "Let's go",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 26,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
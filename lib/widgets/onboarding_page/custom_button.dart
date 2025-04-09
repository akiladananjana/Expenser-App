import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  const CustomButton({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: const Color(0xFF7F3DFF),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

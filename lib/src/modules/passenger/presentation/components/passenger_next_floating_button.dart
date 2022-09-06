import 'package:flutter/material.dart';

class PassengerNextFloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final Color _buttonColor = const Color(0xFF16A45C);
  final Color _disabledButtonColor = const Color(0xFF89BBA2);

  const PassengerNextFloatingButton({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          backgroundColor: _buttonColor,
          disabledBackgroundColor: _disabledButtonColor,
        ),
        child: const Text(
          "Avançar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

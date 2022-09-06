import 'package:flutter/material.dart';

class PassengerCancelTextButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PassengerCancelTextButton({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        foregroundColor: Colors.transparent,
      ),
      child: const Text(
        "Cancelar",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

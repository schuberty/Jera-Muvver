import 'package:flutter/material.dart';

class PassengerSubtitleTextWidget extends StatelessWidget {
  final String text;

  const PassengerSubtitleTextWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}

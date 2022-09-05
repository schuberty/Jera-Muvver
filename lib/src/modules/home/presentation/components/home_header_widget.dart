import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: "Facilitando seus ",
        style: TextStyle(
          color: Color(0xFF222222),
          fontSize: 24,
          fontFamily: "TitilliumWeb",
        ),
        children: <TextSpan>[
          TextSpan(text: "envios", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: "."),
        ],
      ),
    );
  }
}

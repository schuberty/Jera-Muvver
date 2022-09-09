import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: "Facilitando seus ",
        style: TextStyle(
          color: AppConstants.darkColor,
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

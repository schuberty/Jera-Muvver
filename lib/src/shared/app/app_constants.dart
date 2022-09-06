import 'package:flutter/widgets.dart';

class AppConstants {
  static const secondaryColor = Color(0xFFB8B8B8);

  static LinearGradient linearGradientBlackToGrey({bool useRotation = false}) {
    return LinearGradient(
      colors: const <Color>[Color(0xFF353740), Color(0xFF222222)],
      transform: GradientRotation(useRotation ? -0.1 : 0),
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );
  }
}

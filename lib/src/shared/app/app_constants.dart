import 'package:flutter/widgets.dart';

class AppConstants {
  const AppConstants._();

  static const primaryColor = Color(0xFF16A45C);
  static const secondaryColor = Color(0xFFB8B8B8);
  static const subtitleColor = Color(0x8A222222);
  static const darkColor = Color(0xFF222222);

  static LinearGradient linearDarkGradient({bool useRotation = true}) {
    return LinearGradient(
      colors: const <Color>[Color(0xFF353740), Color(0xFF222222)],
      transform: GradientRotation(useRotation ? -0.1 : 0),
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );
  }
}

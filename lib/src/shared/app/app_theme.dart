import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_constants.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData themeData() {
    return ThemeData(
      fontFamily: "TitilliumWeb",
      useMaterial3: true,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppConstants.primaryColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_router.dart';
import 'package:jera_muvver/src/shared/app/app_theme.dart';

class MuvverApp extends StatelessWidget {
  const MuvverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appThemeData(),
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}

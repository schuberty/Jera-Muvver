import 'package:flutter/material.dart';
import 'package:jera_muvver/src/app_modules.dart';
import 'package:jera_muvver/src/shared/app/app_router.dart';
import 'package:jera_muvver/src/shared/app/app_theme.dart';
import 'package:provider/provider.dart';

class MuvverApp extends StatelessWidget {
  const MuvverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appModules,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData(),
        onGenerateRoute: AppRouter.onGenerateRoutes,
      ),
    );
  }
}

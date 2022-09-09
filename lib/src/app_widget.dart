import 'package:flutter/material.dart';
import 'package:jera_muvver/src/app_modules.dart';
import 'package:jera_muvver/src/shared/app/app_router.dart';
import 'package:jera_muvver/src/shared/app/app_theme.dart';
import 'package:jera_muvver/src/shared/services/inform_service.dart';
import 'package:provider/provider.dart';

class MuvverApp extends StatelessWidget {
  const MuvverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appModules,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: InformService().globalNavigator,
        onGenerateRoute: AppRouter.onGenerateRoutes,
        theme: AppTheme.themeData(),
      ),
    );
  }
}

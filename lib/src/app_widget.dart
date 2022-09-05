import 'package:flutter/material.dart';
import 'package:jera_muvver/src/shared/app/app_router.dart';

class MuvverApp extends StatelessWidget {
  const MuvverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}

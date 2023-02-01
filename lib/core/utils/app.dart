import 'package:flutter/material.dart';
import 'package:weapp/core/utils/styles.dart';

import '../routes/app_router.dart';

class WeatherApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "DVT WeatherApp",
      themeMode: ThemeMode.system,
      theme: AppTheme(),
      routerDelegate: appRouter.delegate(initialRoutes: [WelcomeRoute()]),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}

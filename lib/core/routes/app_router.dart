import "package:auto_route/auto_route.dart";
import 'package:flutter/material.dart';
import 'package:weapp/features/home/presentation/pages/home_page.dart';

import '/features/home/presentation/pages/welcome_page.dart';

part "app_router.gr.dart";

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomePage, initial: true),
    AutoRoute(page: HomePage)
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

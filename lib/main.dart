import 'package:e_commerce_app_c10_mon/core/config/application_theme_manager.dart';
import 'package:e_commerce_app_c10_mon/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_mon/core/config/routes.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ApplicationThemeManager.themeData,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: Routes.onGenerate,
      navigatorKey: navigatorKey,
    );
  }
}

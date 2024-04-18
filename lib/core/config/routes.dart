import 'package:e_commerce_app_c10_mon/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_mon/features/layout/pages/layout_view.dart';
import 'package:e_commerce_app_c10_mon/features/login/pages/login_view.dart';
import 'package:e_commerce_app_c10_mon/features/registration/pages/register_view.dart';
import 'package:e_commerce_app_c10_mon/features/splash/pages/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PageRoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );

      case PageRoutesName.registration:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
          settings: settings,
        );

      case PageRoutesName.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app_c10_mon/core/config/application_theme_manager.dart';
import 'package:e_commerce_app_c10_mon/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_mon/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/services/my_bloc_observer.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E_commerce App',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.themeData,
      themeMode: ThemeMode.light,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: Routes.onGenerate,
      navigatorKey: navigatorKey,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}

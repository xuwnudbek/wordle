import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle/pages/404/not_found.dart';
import 'package:wordle/services/storage_service.dart';

import 'package:wordle/utils/routes.dart';
import 'package:wordle/utils/theme_data_2.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init("wordle");

  runZonedGuarded(
    () => runApp(const MainApp()),
    (_, __) {
      print("Error: $_");
      print("Stack: $__");
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData2.getThemeData,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
      defaultTransition: Transition.cupertino,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
    );
  }
}

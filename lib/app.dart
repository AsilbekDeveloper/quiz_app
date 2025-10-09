import 'package:flutter/material.dart';
import 'package:quiz_app/core/router/route_generator.dart';
import 'package:quiz_app/core/router/route_names.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.homePage,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
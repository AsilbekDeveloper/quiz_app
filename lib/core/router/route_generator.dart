import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/router/route_names.dart';
import 'package:quiz_app/feature/presentation/pages/home_page.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
      // case RouteNames.categoriesPage:
      //   return MaterialPageRoute(builder: (context) => C)
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text("Page not found")),
      ),
    );
  }
}

import 'package:bloc_clean_arch/config/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views/views.dart';

class AppRoute {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.route_splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteName.route_homescreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.route_loginscreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: const Center(child: Text("Error in Routes")),
          );
        });
    }
  }
}

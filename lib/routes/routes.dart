import 'package:event_booking/screen/auth/login/login-screen.dart';
import 'package:event_booking/screen/auth/signup/signup-screen.dart';
import 'package:event_booking/screen/home/home-screen.dart';
import 'package:event_booking/screen/splash_screen/splash-screen.dart';

import 'routes_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUpScreen(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}

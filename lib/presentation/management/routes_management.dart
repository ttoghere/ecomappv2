import 'package:flutter/material.dart';
import '../view/view_shelf.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardRoute = "/onBoard";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPassRoute = "/fPass";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/sDetail";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.onBoardRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.forgotPassRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (context) => const DetailScreen());
      default:
        return MaterialPageRoute(builder: (context) => const UndefinedRoute());
    }
  }
}

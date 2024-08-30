import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Ui/Pages/Home/Home.dart';
import 'package:prueba_tecnica/Ui/Pages/Created%20Account/Create-account.dart';
import 'package:prueba_tecnica/Ui/Pages/Login/Login.dart';
import 'package:prueba_tecnica/Ui/Pages/Splash/Splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String createAccount = '/create-account';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccount());
      case home:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

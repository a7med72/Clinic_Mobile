import 'package:clinic_mobile/Feature/onBoard/onboard.dart';
import 'package:clinic_mobile/core/Routing/routres.dart';
import 'package:flutter/material.dart';

import '../../Feature/Auth/presentation/pages/login.dart';
import '../../Feature/Home Screen/pressentation/page/home_screen.dart';

class AppRoutre {
  Route? generateRoute(RouteSettings settings) {
    final argrments = settings.arguments;
    switch (settings.name) {
      case Routre.login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );

      case Routre.onBoard:
        return MaterialPageRoute(builder: (context) => const Onboard());
      case Routre.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return null;
    }
  }
}

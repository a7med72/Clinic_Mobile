import 'package:clinic_mobile/Feature/onBoard/onboard.dart';
import 'package:clinic_mobile/core/Routing/routres.dart';
import 'package:flutter/material.dart';

class AppRoutre {
  Route? generateRoute(RouteSettings settings) {
    final argrments = settings.arguments;
    switch (settings.name) {
      case Routre.login:
        return MaterialPageRoute(
          builder: (context) => const Text('Login Screen'),
        );

      case Routre.onBoard:
        return MaterialPageRoute(builder: (context) => const Onboard());

      default:
        return null;
    }
  }
}

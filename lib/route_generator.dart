import 'package:final_flutterr/mypages/AnaBase.dart';
import 'package:final_flutterr/mypages/Base_alti/Animasyonlar.dart';
import 'package:final_flutterr/mypages/Base_alti/Grafikler.dart';
import 'package:final_flutterr/mypages/Sairler.dart';
import 'package:final_flutterr/mypages/login.dart';
import 'package:final_flutterr/sairler/ahmetmuhip.dart';
import 'package:final_flutterr/sairler/edipcansever.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/AnaBase':
        return MaterialPageRoute(
          builder: (context) => AnaBase(),
        );

      case '/AhmetMuhipDiranas':
        return MaterialPageRoute(
          builder: (context) => AhmetMuhip(),
        );
      case '/Ahmetmuhipsiirleri':
        return MaterialPageRoute(
          builder: (context) => Ahmetmuhipsiirleri(),
        );

      case '/EdipCansever':
        return MaterialPageRoute(
          builder: (context) => EdipCansever(),
        );
      case '/Edipcanseversiirleri':
        return MaterialPageRoute(
          builder: (context) => EdipCanseversiirleri(),
        );

      case '/Grafikler':
        return MaterialPageRoute(
          builder: (context) => Grafikler(),
        );
      case '/Animasyonlar':
        return MaterialPageRoute(
          builder: (context) => Animasyonlar(),
        );

      case '/Sairler':
        return MaterialPageRoute(
          builder: (context) => Sairler(),
        );
      case '/LoginScreen':
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}

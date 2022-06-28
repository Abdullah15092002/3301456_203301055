import 'package:final_flutterr/mypages/AnaBase.dart';
import 'package:final_flutterr/mypages/Sairler.dart';
import 'package:final_flutterr/route_generator.dart';
import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: Scaffold(body: Sairler()),
    );
  }
}

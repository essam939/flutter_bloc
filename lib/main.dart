import 'package:bblocex/app_route.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(BreakingBadApp(appRoute:AppRoute()));
}
class BreakingBadApp extends StatelessWidget {
AppRoute appRoute;

BreakingBadApp({required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:appRoute.generateAppRoutes,
    );
  }
}

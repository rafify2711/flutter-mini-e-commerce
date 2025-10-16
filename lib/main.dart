import 'package:flutter/material.dart';
import 'core/config/route_generator.dart';
import 'core/config/routes_name.dart';
import 'core/di/di.dart';

void main() {
  runApp(const MyApp());
  configureDependencies();
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini E-Commerce',
      navigatorKey: navigatorKey,
      initialRoute: RoutesName.layOut,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.onGenerator,
    );
  }
}


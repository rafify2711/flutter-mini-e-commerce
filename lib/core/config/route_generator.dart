import 'package:flutter/material.dart';
import 'package:flutter_task/core/config/routes_name.dart';
import 'package:flutter_task/features/home/presentation/view/home_screen.dart';
import 'package:flutter_task/features/lay_out/lay_out.dart';
import '../../features/cart/presentation/view/cart_screen.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.layOut:
        return MaterialPageRoute(
          builder: (context) => LayOut(),
          settings: settings,
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case RoutesName.cart:
        return MaterialPageRoute(
          builder: (context) => CartScreen(),
          settings: settings,
        );
    }
    return null;
  }}
import 'package:flutter/material.dart';
import 'package:flutter_task/features/lay_out/lay_out.dart';

import 'core/di/di.dart';

void main() {
  runApp(const MyApp());
  configureDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini E-Commerce',
      home: LayOut(),
    );
  }
}


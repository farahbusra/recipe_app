import 'package:flutter/material.dart';
import 'package:recipe_app/onboarding/onboarding.dart';
import 'package:recipe_app/pages/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie Recipe',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: OnboardingScreen(),
      routes: {
        '/index': (context) => const MyIndex(),
      },
    );
  }
}

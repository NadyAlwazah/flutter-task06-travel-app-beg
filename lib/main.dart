import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}

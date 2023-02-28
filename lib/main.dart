import 'package:flutter/material.dart';
import 'package:optima/pages/classroom_page.dart';
import 'package:optima/pages/get_started.dart';
import 'package:optima/pages/home_page.dart';
import 'package:optima/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/getStarted': (context) => const GetStarted(),
        '/homePage': (context) => const HomePage(),
        '/classroompage': (context) => const ClassroomPage(),
      },
    );
  }
}

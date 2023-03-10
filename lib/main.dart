import 'package:flutter/material.dart';
import 'package:optima/pages/classroom_page.dart';
import 'package:optima/pages/get_started.dart';
import 'package:optima/pages/home_page.dart';
import 'package:optima/pages/main_page.dart';
import 'package:optima/pages/splash_screen.dart';
import 'package:provider/provider.dart';

import 'database/provider/kelas_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KelasProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/getStarted': (context) => const GetStarted(),
        '/mainPage': (context) => const MainPage(),
        '/homePage': (context) => const HomePage(),
        '/classroompage': (context) => const ClassroomPage(),
      },
    );
  }
}

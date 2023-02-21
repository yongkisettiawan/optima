import 'dart:async';

import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, '/getStarted');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'OPTIMA',
          style: textStyle.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}

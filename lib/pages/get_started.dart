import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';
import 'package:optima/widgets/custom_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/started_img.png',
                height: 240,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Optimasi Belajar untuk\nHasil Terbaik ',
                textAlign: TextAlign.center,
                style: textStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              const CustomButton(
                title: 'Get Started',
                // onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

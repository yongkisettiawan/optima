import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          margin: EdgeInsets.only(
            top: 10,
            right: defaultMargin,
            left: defaultMargin,
          ),
          child: Column(
            children: [
              Text(
                'Welcome',
                style: textStyle.copyWith(
                  color: kPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

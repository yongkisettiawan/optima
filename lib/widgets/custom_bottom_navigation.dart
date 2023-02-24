import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';

class CustomBottomNavigation extends StatelessWidget {
  final navIcon;
  final navName;

  const CustomBottomNavigation({
    Key? key,
    required this.navIcon,
    required this.navName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(navIcon),
          ),
          Text(
            navName,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

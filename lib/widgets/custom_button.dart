import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  // final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: textStyle.copyWith(
              color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

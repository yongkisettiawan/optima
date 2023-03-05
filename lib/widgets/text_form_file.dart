import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CustomTextFormFile extends StatelessWidget {
  const CustomTextFormFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 0,
          ),
          hintText: 'class name',
          hintStyle: textStyle.copyWith(
            color: kGreyTextColor,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

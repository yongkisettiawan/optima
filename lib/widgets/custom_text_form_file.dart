import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CustomTextFormFile extends StatelessWidget {
  final void Function(int) deleteCallback;
  int index;

  CustomTextFormFile({
    Key? key,
    required this.index,
    required this.deleteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                hintText: '',
                hintStyle: textStyle.copyWith(
                  color: kGreyTextColor,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () => deleteCallback(index),
            icon: Icon(Icons.delete, color: kGreyTextColor),
            splashRadius: 24,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

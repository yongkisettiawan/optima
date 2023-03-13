import 'package:flutter/material.dart';
// import 'package:optima/database/provider/silabus_provider.dart';
// import 'package:provider/provider.dart';

import '../shared/theme.dart';

class CustomTextFormFile extends StatefulWidget {
  const CustomTextFormFile({
    Key? key,
    required TextEditingController controller,
  }) : super(key: key);

  @override
  State<CustomTextFormFile> createState() => _CustomTextFormFileState();
}

class _CustomTextFormFileState extends State<CustomTextFormFile> {
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tidak Boleh Kosong';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

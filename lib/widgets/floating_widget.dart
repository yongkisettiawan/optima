import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';
import 'package:optima/widgets/custom_text_form_file.dart';

class FloatingWidget extends StatefulWidget {
  final VoidCallback hideCallback;
  const FloatingWidget({Key? key, required this.hideCallback})
      : super(key: key);

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  final _formKey = GlobalKey<FormState>();
  final _namaKelasController = TextEditingController();
  final List<CustomTextFormFile> _customTextFormFiles = [];

  @override
  void dispose() {
    _namaKelasController.dispose();
    super.dispose();
  }

  //tambah widget input silabus
  void _addCustomTextFormFile(int index) {
    setState(() {
      _customTextFormFiles.add(
        const CustomTextFormFile(),
      );
    });
  }

  //hapus widget input silabus
  void _removeCustomTextFormFile(int i) {
    setState(() {
      _customTextFormFiles.removeLast();
    });
  }

  //save data
  Future<void> _saveKelas() async {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 30,
              bottom: 100,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultRadius)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //Title
                  const Center(
                    child: Text(
                      'Pelajaran Baru',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        //input nama kelas
                        TextFormField(
                          controller: _namaKelasController,
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'judul',
                            hintStyle: textStyle.copyWith(
                              color: kGreyTextColor,
                              fontSize: 14,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //silabus title
                              Text(
                                'Silabus',
                                style: textStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _removeCustomTextFormFile(
                                          _customTextFormFiles.length - 1);
                                    },
                                    icon: Icon(Icons.remove,
                                        color: kGreyTextColor),
                                    splashRadius: 24,
                                    padding: EdgeInsets.zero,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _addCustomTextFormFile(
                                          _customTextFormFiles.length);
                                    },
                                    icon:
                                        Icon(Icons.add, color: kGreyTextColor),
                                    splashRadius: 24,
                                    padding: EdgeInsets.zero,
                                    // constraints: BoxConstraints(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ..._customTextFormFiles,
                      ],
                    ),
                  ),
                  //button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            widget.hideCallback();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kWhiteColor,
                              side: BorderSide(
                                color: kPrimaryColor,
                                width: 1,
                              )),
                          child: Text(
                            'batal',
                            style: textStyle.copyWith(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            'simpan',
                            style: textStyle.copyWith(
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

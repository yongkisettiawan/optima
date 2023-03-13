import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:optima/database/utils/database_halper.dart';
import 'package:optima/shared/theme.dart';
import 'package:optima/widgets/custom_text_form_file.dart';
import 'package:provider/provider.dart';

import '../database/models/kelas_model.dart';
import '../database/models/silabus_model.dart';
import '../database/provider/kelas_provider.dart';
import '../database/provider/silabus_provider.dart';

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
  final List<TextEditingController> _silabusControllers = [];
  int _silabusCount = 0;

  @override
  void dispose() {
    _namaKelasController.dispose();
    _silabusControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _addSilabus() {
    setState(() {
      _silabusControllers.add(TextEditingController());
      _silabusCount++;
    });
  }

  void _saveData() async {
    if (_formKey.currentState!.validate()) {
      // Insert Kelas
      final kelasProvider = Provider.of<KelasProvider>(context, listen: false);
      final kelas = TabelKelas(namaKelas: _namaKelasController.text);
      await kelasProvider.insertKelas(kelas);

      // Insert Silabus
      final silabusProvider =
          Provider.of<SilabusProvider>(context, listen: false);
      final silabus = _silabusControllers
          .map((controller) => TabelSilabus(
                kelasId: kelas.kelasId!,
                namaSilabus: controller.text,
              ))
          .toList();
      await silabusProvider.insertSilabusBatch(silabus);

      widget.hideCallback();
    }
  }

  //hapus widget input silabus
  void _removeCustomTextFormFile(int i) {
    setState(() {
      _silabusControllers.removeLast();
      _silabusCount--;
    });
  }

  //save data

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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak Boleh Kosong';
                            }
                            return null;
                          },
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
                                          _silabusControllers.length - 1);
                                    },
                                    icon: Icon(Icons.remove,
                                        color: kGreyTextColor),
                                    splashRadius: 24,
                                    padding: EdgeInsets.zero,
                                  ),
                                  IconButton(
                                    onPressed: _addSilabus,
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
                        ...List.generate(
                          _silabusCount,
                          (index) => CustomTextFormFile(
                              controller: _silabusControllers[index]),
                        ),
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
                          onPressed: _saveData,
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

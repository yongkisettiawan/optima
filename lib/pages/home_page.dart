import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:optima/database/local/database_halper.dart';
import 'package:optima/database/models/kelas_model.dart';
import 'package:optima/shared/theme.dart';
import '../widgets/floating_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _isFloatingWidgetVisible = false;

class _HomePageState extends State<HomePage> {
  void _hideFloatingWidget() {
    setState(() {
      _isFloatingWidgetVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/classroompage');
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/DatabaseOutlined.png',
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "pelajaran.title",
                    style: textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '12 0f 12 ',
                        style: textStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: kSecondaryColor,
                        ),
                      ),
                      Text(
                        'session finished',
                        style: textStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Column(
          children: [
            Row(
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
            const SizedBox(
              height: 15,
            ),
            content(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            header(),
            _isFloatingWidgetVisible
                ? FloatingWidget(hideCallback: _hideFloatingWidget)
                : const SizedBox(),
          ],
        ),

        //Tambah Pelajaran Baru
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isFloatingWidgetVisible = true;
            });
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

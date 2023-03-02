import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';

class ClassroomPage extends StatelessWidget {
  const ClassroomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: kPrimaryColor,
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                  bottom: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Algoritma',
                      style: textStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Image.asset('assets/titik_tiga.png'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.20,
                ),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultRadius),
                      topRight: Radius.circular(defaultRadius),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: kWhiteColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            height: 70,
                            color: kGreyTextColor,
                            child: const Center(
                              child: Text('Content 2'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

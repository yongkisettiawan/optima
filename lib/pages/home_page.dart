import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';

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
    // Widget customBottomNavigation() {
    //   return Align(
    //     alignment: Alignment.bottomCenter,
    //     child: Container(
    //       width: double.infinity,
    //       height: 80,
    //       color: kWhiteColor,
    //       padding: const EdgeInsets.only(
    //         top: 13,
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         // ignore: prefer_const_literals_to_create_immutables
    //         children: [
    //           const CustomBottomNavigation(
    //             navIcon: 'assets/home_nav.png',
    //             navName: 'Home',
    //           ),
    //           const CustomBottomNavigation(
    //             navIcon: 'assets/calender_nav.png',
    //             navName: 'Calender',
    //           ),
    //           const CustomBottomNavigation(
    //             navIcon: 'assets/stats_nav.png',
    //             navName: 'Stats',
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

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
                    'Logika Pemogramman',
                    style: textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '30 of 30 ',
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

class FloatingWidget extends StatefulWidget {
  final VoidCallback hideCallback;
  const FloatingWidget({Key? key, required this.hideCallback})
      : super(key: key);

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
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
          bottom: 200,
          right: 20,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.white,
            child: Column(
              children: [
                const Text(
                  'Floating Widget',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    widget.hideCallback();
                  },
                  child: const Text('Hide Widget'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

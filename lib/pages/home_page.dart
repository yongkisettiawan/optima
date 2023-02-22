import 'package:flutter/material.dart';
import 'package:optima/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
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
              Container(
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
              Container(
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
                        color: kSecondaryColor,
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
                              '15 of 30 ',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

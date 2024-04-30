import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/onboading/login_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

import 'extra_screen_2.dart';

class ExtraScreen1 extends StatefulWidget {
  const ExtraScreen1({super.key});

  @override
  State<ExtraScreen1> createState() => _ExtraScreen1State();
}

class _ExtraScreen1State extends State<ExtraScreen1> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Get.offAll(() => const LoginScreen());
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: AppColors.yellowColor),
              ))
        ],
      ),
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/circle.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome To',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Bitcoin Invest',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * 0.07,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const ExtraScreen2());
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

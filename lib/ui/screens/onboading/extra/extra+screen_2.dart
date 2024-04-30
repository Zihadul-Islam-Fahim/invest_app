import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/onboading/extra/extra_screen_3.dart';
import 'package:invest_app/ui/screens/onboading/login_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

class ExtraScreen2 extends StatefulWidget {
  const ExtraScreen2({super.key});

  @override
  State<ExtraScreen2> createState() => _ExtraScreen2State();
}

class _ExtraScreen2State extends State<ExtraScreen2> {
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
                  "assets/images/security.png",
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
                  'Transaction',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'poppins', fontSize: 30, fontWeight: FontWeight.bold,),
                ),
                Text(
                  'Security',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'poppins', fontSize: 30, fontWeight: FontWeight.bold,),
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
                        Get.to(() => ExtraScreen3());
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

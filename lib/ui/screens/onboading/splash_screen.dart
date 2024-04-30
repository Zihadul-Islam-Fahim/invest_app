import 'package:flutter/material.dart';
import 'package:invest_app/ui/screens/onboading/extra/extra_screen_1.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExtraScreen1(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: height * 0.4,
          width: height * 0.5,
          child: Image.asset(
            "assets/images/logo+text.png",
            height: height * 0.7,
            color: AppColors.yellowColor,
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}

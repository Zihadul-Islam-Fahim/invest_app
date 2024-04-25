import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/login_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          fillColor: Colors.white,
          hintStyle: const TextStyle(fontFamily: 'poppins'),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.yellowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            // backgroundColor: Colors.grey[100]?.withOpacity(0.7),
            side: BorderSide(color: AppColors.yellowColor, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
            animationDuration: Duration(seconds: 1),
          ),
        ),),
      home: LoginScreen(),
    );
  }
}

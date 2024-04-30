import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/onboading/splash_screen.dart';
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
          fillColor: Colors.white.withOpacity(0.15),
          hintStyle:
              TextStyle(fontFamily: 'poppins', color: Colors.grey.shade700),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(3)
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.yellowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: OutlinedButton.styleFrom(
           textStyle: const TextStyle(fontFamily: 'poppins',fontSize: 20)
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

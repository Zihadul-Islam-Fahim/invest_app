import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/onboading/signup_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

import 'forgot_pass_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _passwordTEControlller = TextEditingController();
  bool isVisiblePass = true;

  void showAndHidePass() {
    isVisiblePass = !isVisiblePass;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: size.width * 0.5,
                    color: AppColors.yellowColor,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: const Text(
                      "The Right Place for Your Digital Assets",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email Address',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: _emailTEControlller,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter email";
                          }
                        },
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: _passwordTEControlller,
                        obscureText: isVisiblePass,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter password";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Your Password',
                          suffixIcon: IconButton(
                            onPressed: showAndHidePass,
                            icon: isVisiblePass
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.white60,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white60,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: Visibility(
                          // visible: controller.inProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.navyBlue),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: size.height * 0.06,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const SignupScreen());
                            },
                            child: const Text(
                              'Create an account',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'poppins',
                                  color: AppColors.yellowColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const VerticalDivider(
                            color: AppColors.yellowColor,
                            endIndent: 15,
                            indent: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forgot Password',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

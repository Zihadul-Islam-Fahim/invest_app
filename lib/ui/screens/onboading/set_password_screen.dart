import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:invest_app/ui/utilities/app_colors.dart';
import 'login_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTEControlller = TextEditingController();
  final TextEditingController _confirmPasswordTEControlller = TextEditingController();

  bool isVisiblePass1 = true;
  bool isVisiblePass2 = true;

  void showAndHidePass1() {
    isVisiblePass1 = !isVisiblePass1;
    setState(() {});
  }
  void showAndHidePass2() {
    isVisiblePass2 = !isVisiblePass2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Reset Password',
          style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'New Password',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: _passwordTEControlller,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white,fontFamily: 'poppins'),
                        obscureText: isVisiblePass1,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter password";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            onPressed: showAndHidePass1,
                            icon: isVisiblePass1
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
                        height: size.height * 0.026,
                      ),
                      const Text(
                        'Retype_Password',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: _confirmPasswordTEControlller,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white,fontFamily: 'poppins'),
                        obscureText: isVisiblePass2,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter password";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter retype password',
                          suffixIcon: IconButton(
                            onPressed: showAndHidePass2,
                            icon: isVisiblePass2
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
                      const Text(
                        'At least 8 character with uppercase letters and numbers',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: size.height * 0.03),
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
                              'Reset Password',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'poppins',
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAll(() => const LoginScreen());
                          },
                          child: const Text(
                            'Log in!',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'poppins',
                                color: AppColors.yellowColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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

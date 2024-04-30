import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/onboading/pin_verification%20screen.dart';

import 'package:invest_app/ui/utilities/app_colors.dart';
import 'login_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _passwordTEControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
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
                  Text(
                    "A 4 digit pin will send to your email address.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: Colors.white),
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
                        style: const TextStyle(color: Colors.white,fontFamily: 'poppins'),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter email";
                          }
                        },
                        decoration: const InputDecoration(hintText: 'Email'),
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
                              if (_formKey.currentState!.validate()) {
                                Get.to(()=> PinVerifyScreen(email: "fahimzihad@gmail.com"));
                              }
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
                            Get.back();
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

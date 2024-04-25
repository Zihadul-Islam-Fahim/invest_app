import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/forgot_pass_screen.dart';
import 'package:invest_app/ui/screens/signup_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _passwordTEControlller = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  bool isVisiblePass = false;
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
                  Image.asset(
                    "assets/images/bitcoins-preview.png",
                    width: size.width * 0.7,
                  ),
                  const Text(
                    "Bitcoin Invest",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: double.infinity,

                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Text(
                          "SIGNUP",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          controller: _emailTEControlller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return "enter name";
                            }
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              hintText: 'Name'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          controller: _nameEditingController,
                          keyboardType: TextInputType.text,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return "enter email";
                            }
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              hintText: 'Email'),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        TextFormField(
                          controller: _passwordTEControlller,
                          obscureText: isVisiblePass,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return "enter password";
                            }
                          },
                          decoration: InputDecoration(

                              prefixIcon: Icon(Icons.lock),

                              hintText: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: showAndHidePass,
                                  icon: isVisiblePass
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off))),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: Visibility(
                            // visible: controller.inProgress == false,
                            replacement: Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.navyBlue),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: const Text(
                                'SIGNUP',
                                style: TextStyle(
                                  fontSize: 16,
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
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

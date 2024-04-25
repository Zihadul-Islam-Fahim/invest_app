import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/forgot_pass_screen.dart';
import 'package:invest_app/ui/screens/signup_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _passwordTEControlller = TextEditingController();
  bool isVisiblePass = false;
  void showAndHidePass() {
    isVisiblePass = !isVisiblePass;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                      color: Colors.black,
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

                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          controller: _emailTEControlller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return "enter email";
                            }
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail,color: AppColors.yellowColor,),
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

                              prefixIcon: Icon(Icons.lock,color: AppColors.yellowColor),

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
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
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
                    height: 55,
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'FORGOT PASSWORD?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    width: size.width * 0.6,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: Text(
                        'SIGNUP',
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'poppins',
                            color: Colors.black,
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

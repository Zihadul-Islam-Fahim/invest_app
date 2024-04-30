import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/onboading/login_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _passwordTEControlller = TextEditingController();
  bool isVisiblePass = true;
  bool isChecked = false;

  void showAndHidePass() {
    isVisiblePass = !isVisiblePass;
    setState(() {});
  }

  onChecked(v) {
    isChecked = !isChecked;
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
          'Sign up',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'First Name',
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
                            return "enter first name";
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter your first name'),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      const Text(
                        'Last Name',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        controller: _passwordTEControlller,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter last name";
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your last name',
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      const Text(
                        'Email Address',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter email";
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter your email addess'),
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
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'poppins'),
                        obscureText: isVisiblePass,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "enter password";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password ',
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
                      const Text(
                        'At least 8 character with uppercase letters and numbers',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: onChecked,
                            activeColor: AppColors.yellowColor,
                            side: const BorderSide(color: Colors.white),
                          ),
                          RichText(
                            text: const TextSpan(
                              text: "Accept ",
                              style: TextStyle(
                                  fontFamily: 'poppins', fontSize: 13),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "Terms of use",
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 13,
                                      color: AppColors.yellowColor),
                                ),
                                TextSpan(
                                  text: " &",
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 13,
                                  ),
                                ),
                                TextSpan(
                                  text: " Privacy and Policy",
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 13,
                                      color: AppColors.yellowColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
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
                              'Sign up',
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
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
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
                            Get.to(() => const LoginScreen());
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

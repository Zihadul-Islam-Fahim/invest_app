import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/forgot_pass_screen.dart';
import 'package:invest_app/ui/screens/signup_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();

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
                          "LOGIN",
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
                                'SEND CODE',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

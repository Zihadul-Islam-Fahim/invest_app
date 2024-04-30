import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest_app/ui/screens/onboading/set_password_screen.dart';
import 'package:invest_app/ui/utilities/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerifyScreen extends StatefulWidget {
  final String email;

  const PinVerifyScreen({super.key, required this.email});

  @override
  State<PinVerifyScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<PinVerifyScreen> {
  final TextEditingController otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Verification',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                'Code has been send to uour email',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 14, color: Colors.grey, fontFamily: 'poppins'),
              ),
              Text(
                widget.email,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: 'poppins'),
              ),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 70,
                    fieldWidth: 70,
                    activeFillColor: Colors.white,
                    inactiveColor: AppColors.yellowColor,
                    inactiveFillColor: Colors.transparent,
                    selectedFillColor: Colors.transparent,
                    selectedColor: Colors.white),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                appContext: context,
                controller: otpTEController,
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellowColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: Visibility(
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.to(()=>SetPasswordScreen());
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

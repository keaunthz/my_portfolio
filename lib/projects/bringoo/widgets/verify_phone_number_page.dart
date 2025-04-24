import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:pinput/pinput.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

const defaultCountdown = 60;

final defaultPinTheme = PinTheme(
  width: 50.sp,
  height: 50.sp,
  textStyle: TextStyle(
    fontSize: 23.0,
    color: BringooColors.neutral.shade800,
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: BringooColors.neutral.shade300),
    borderRadius: BorderRadius.circular(8.0),
    color: Colors.white,
  ),
);

class VerifyPhoneNumberPage extends StatefulWidget {
  const VerifyPhoneNumberPage({super.key});

  @override
  State<VerifyPhoneNumberPage> createState() => _VerifyPhoneNumberPageState();
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController smsPinController = TextEditingController();

  PhoneNumber phoneNumber = const PhoneNumber(isoCode: 'VN', nsn: '123456789');
  int start = defaultCountdown;
  bool canResend = false;
  bool loading = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    smsPinController.dispose();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      canResend = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        timer.cancel();
        setState(() {
          start = defaultCountdown;
          canResend = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify your number')),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: BringooColors.neutral[50],
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Enter the verification code sent to',
                    style: BringooTypoGraphy.captionRegular(context),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '(+${phoneNumber.isoCode}) ${phoneNumber.nsn}',
                        style: BringooTypoGraphy.paragraph01SemiBold(context),
                      ),
                      const SizedBox(width: 4.0),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Change',
                          style: BringooTypoGraphy.paragraph01SemiBold(
                            context,
                          ).copyWith(color: BringooColors.primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Pinput(
                    controller: smsPinController,
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyDecorationWith(
                      border: Border.all(color: BringooColors.primary),
                    ),
                    errorPinTheme: defaultPinTheme.copyDecorationWith(
                      border: Border.all(color: BringooColors.error),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your verification code';
                      }
                      if (value.trim().length != 4) {
                        return 'Invalid verification code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'Didn\'t receive any code?',
                    style: BringooTypoGraphy.captionRegular(context),
                  ),
                  const SizedBox(height: 4.0),
                  canResend
                      ? GestureDetector(
                        onTap: () {
                          setState(() {
                            start = defaultCountdown;
                          });
                          startTimer();
                          // call resend logic here
                        },
                        child: Text(
                          'Resend',
                          style: BringooTypoGraphy.paragraph01SemiBold(
                            context,
                          ).copyWith(color: BringooColors.primary),
                        ),
                      )
                      : Text(
                        'Resend in $start seconds',
                        style: BringooTypoGraphy.paragraph01SemiBold(
                          context,
                        ).copyWith(color: BringooColors.primary),
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

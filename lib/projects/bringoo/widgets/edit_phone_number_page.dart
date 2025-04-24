import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:portfolio/projects/bringoo/widgets/text_label.dart';
import 'package:portfolio/projects/bringoo/widgets/verify_phone_number_page.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';
import 'package:portfolio/utils/app.dart';

class EditPhoneNumberPage extends StatefulWidget {
  const EditPhoneNumberPage({super.key});

  @override
  State<EditPhoneNumberPage> createState() => _EditPhoneNumberPageState();
}

class _EditPhoneNumberPageState extends State<EditPhoneNumberPage> {
  final formKey = GlobalKey<FormState>();
  final PhoneController phoneController = PhoneController(
    const PhoneNumber(isoCode: 'TH', nsn: ''),
  );

  void handleConfirm() {
    FocusManager.instance.primaryFocus?.unfocus();
    AppUtils.hideKeyboard();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VerifyPhoneNumberPage()),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool validate = formKey.currentState?.validate() ?? true;
    final String nsn = phoneController.value?.nsn ?? '';

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Enter phone number')),
        body: SafeArea(
          child: Container(
            color: BringooColors.neutral[50],
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Enter your phone number for the verification process. We will send a 4-digit code to your phone number.',
                          style: BringooTypoGraphy.captionRegular(context),
                        ),
                        const SizedBox(height: 20.0),
                        const TextLabel(text: 'Phone Number'),
                        const SizedBox(height: 8.0),
                        Form(
                          key: formKey,
                          child: PhoneFormField(
                            defaultCountry: 'TH',
                            controller: phoneController,
                            onChanged: (p0) => setState(() {}),
                            decoration: InputDecoration(
                              hintText: '00000000',
                              hintStyle: BringooTypoGraphy.paragraph01Regular(
                                context,
                              ).copyWith(color: BringooColors.neutral),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !validate || nsn.isEmpty
                              ? BringooColors.neutral.shade400
                              : BringooColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: !validate || nsn.isEmpty ? null : handleConfirm,
                    child: Text(
                      'Confirm',
                      style: BringooTypoGraphy.paragraph02SemiBold(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

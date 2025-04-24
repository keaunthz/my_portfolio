import 'package:flutter/material.dart';
import 'package:portfolio/projects/bringoo/widgets/password_field.dart';
import 'package:portfolio/projects/bringoo/widgets/text_label.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formKey = GlobalKey<FormState>();
  final currentPasswordKey = GlobalKey<FormFieldState>();
  final newPasswordKey = GlobalKey<FormFieldState>();
  final confirmNewPasswordKey = GlobalKey<FormFieldState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  final currentPasswordFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();
  final confirmNewPasswordFocusNode = FocusNode();

  bool isFormValid = false;
  bool isPasswordValidatorVisible = false;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    currentPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmNewPasswordFocusNode.dispose();
    super.dispose();
  }

  void validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    setState(() {
      isFormValid = isValid && currentPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password'), centerTitle: true),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Set your new password for your account so you can log in and access the application with the new password.',
                        style: BringooTypoGraphy.captionRegular(context),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextLabel(text: 'Current Password'),
                            const SizedBox(height: 8.0),
                            PasswordField(
                              fieldKey: currentPasswordKey,
                              controller: currentPasswordController,
                              textInputAction: TextInputAction.next,
                              hintText: 'Current Password',
                              focusNode: currentPasswordFocusNode,
                              onSubmitField: () {
                                currentPasswordFocusNode.unfocus();
                                FocusScope.of(
                                  context,
                                ).requestFocus(newPasswordFocusNode);
                              },
                              onChanged: (_) => validateForm(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your current password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            const TextLabel(text: 'New Password'),
                            const SizedBox(height: 8.0),
                            PasswordField(
                              fieldKey: newPasswordKey,
                              controller: newPasswordController,
                              textInputAction: TextInputAction.next,
                              hintText: 'New Password',
                              focusNode: newPasswordFocusNode,
                              onSubmitField: () {
                                newPasswordFocusNode.unfocus();
                                FocusScope.of(
                                  context,
                                ).requestFocus(confirmNewPasswordFocusNode);
                              },
                              onChanged: (value) {
                                newPasswordKey.currentState?.validate();
                                setState(() {
                                  isPasswordValidatorVisible =
                                      value.trim().isNotEmpty &&
                                      (newPasswordKey.currentState
                                              ?.validate() ??
                                          false);
                                });
                                validateForm();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your new password';
                                } else if (value ==
                                    currentPasswordController.text) {
                                  return "New password can't be the same as the current password";
                                }
                                return null;
                              },
                              isPasswordStrongCheck: isPasswordValidatorVisible,
                            ),
                            const SizedBox(height: 20.0),
                            const TextLabel(text: 'Confirm New Password'),
                            const SizedBox(height: 8.0),
                            PasswordField(
                              fieldKey: confirmNewPasswordKey,
                              controller: confirmNewPasswordController,
                              hintText: 'Confirm New Password',
                              focusNode: confirmNewPasswordFocusNode,
                              onChanged: (_) {
                                confirmNewPasswordKey.currentState?.validate();
                                validateForm();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your confirm new password';
                                } else if (value.trim() !=
                                    newPasswordController.text.trim()) {
                                  return 'Confirm new password doesn’t match the new password';
                                } else if (value ==
                                    currentPasswordController.text) {
                                  return "New password can't be the same as the current password";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                        isFormValid
                            ? BringooColors.primary
                            : BringooColors.neutral.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed:
                      isFormValid
                          ? () {
                            // ทำ submit ได้ตรงนี้ เช่น เรียก API
                            Navigator.pop(context);
                          }
                          : null,
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
    );
  }
}

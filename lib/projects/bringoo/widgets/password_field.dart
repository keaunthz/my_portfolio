import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/utils/regex_checker.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.fieldKey,
    this.hintText,
    this.isPasswordStrongCheck = false,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.nextFocusNode,
    this.onSubmitField,
  });

  final GlobalKey<FormFieldState>? fieldKey;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? hintText;
  final bool isPasswordStrongCheck;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function? onSubmitField;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    final trimText = widget.controller.value.text.trim();

    return Column(
      children: [
        TextFormField(
          key: widget.fieldKey,
          controller: widget.controller,
          obscureText: !isVisiblePassword,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          onFieldSubmitted: (value) {
            if (widget.onSubmitField != null) {
              widget.onSubmitField!();
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Password',
            errorStyle:
                widget.isPasswordStrongCheck
                    ? const TextStyle(fontSize: 0, height: 0)
                    : null,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SvgPicture.asset('assets/icon/locked.svg'),
            ),
            suffixIcon: IconButton(
              splashRadius: 16.0,
              onPressed: () {
                setState(() {
                  isVisiblePassword = !isVisiblePassword;
                });
              },
              icon:
                  isVisiblePassword
                      ? SvgPicture.asset(
                        'assets/icon/eye.svg',
                        color: BringooColors.neutral.shade600,
                      )
                      : SvgPicture.asset(
                        'assets/icon/eye_slash.svg',
                        color: BringooColors.neutral.shade600,
                      ),
            ),
          ),
          validator: (value) {
            if (widget.isPasswordStrongCheck) {
              if (widget.validator != null) {
                return widget.validator!(value);
              } else if (!RegexChecker.isAtLeastEightCharacter(value ?? '') ||
                  !RegexChecker.isAtLeastOneUppercase(value ?? '') ||
                  !RegexChecker.isAtLeastOneLowercase(value ?? '') ||
                  !RegexChecker.isAtLeastOneSpecialCharacter(value ?? '') ||
                  !RegexChecker.isAtLeastOneNumber(value ?? '')) {
                return '';
              }
              return null;
            }
            return widget.validator != null ? widget.validator!(value) : null;
          },
          onChanged: (value) {
            setState(() {});
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
        widget.isPasswordStrongCheck
            ? Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                width: double.infinity,
                color: BringooColors.neutral.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password must contain:'),
                    const SizedBox(height: 8.0),
                    ValidatorMessage(
                      isCorrect: RegexChecker.isAtLeastEightCharacter(trimText),
                      text: 'at least 8 characters',
                    ),

                    ValidatorMessage(
                      isCorrect: RegexChecker.isAtLeastOneUppercase(trimText),
                      text: 'at least 1 uppercase',
                    ),
                    ValidatorMessage(
                      isCorrect: RegexChecker.isAtLeastOneLowercase(trimText),
                      text: 'at least 1 lowercase',
                    ),
                    ValidatorMessage(
                      isCorrect: RegexChecker.isAtLeastOneSpecialCharacter(
                        trimText,
                      ),
                      text: 'at least 1 special character',
                    ),
                    ValidatorMessage(
                      isCorrect: RegexChecker.isAtLeastOneNumber(trimText),
                      text: 'at least 1 number',
                    ),
                  ],
                ),
              ),
            )
            : Container(),
      ],
    );
  }
}

class ValidatorMessage extends StatelessWidget {
  final bool isCorrect;
  final String text;

  const ValidatorMessage({super.key, this.isCorrect = false, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(
          color:
              isCorrect ? BringooColors.primary.shade400 : BringooColors.error,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          children: [
            Icon(isCorrect ? Icons.check : Icons.error_outline),
            const SizedBox(width: 12.0),
            DefaultTextStyle(
              style: TextStyle(
                color:
                    isCorrect
                        ? BringooColors.primary.shade400
                        : BringooColors.error,
              ),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';

class BringooTheme {
  static final mainTheme = ThemeData(
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: BringooColors.primary,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      toolbarHeight: 56.0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.minPositive, 40.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(10.0),
        elevation: 0.0,
        // onPrimary: Colors.white,
        textStyle: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.minPositive, 40.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(10.0),
        elevation: 0.0,
        textStyle: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ).copyWith(
        side: WidgetStateProperty.resolveWith<BorderSide>((
          Set<WidgetState> states,
        ) {
          return const BorderSide(color: BringooColors.primary, width: 1);
        }),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      errorMaxLines: 2,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: BringooColors.neutral.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: BringooColors.primary.shade400),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 12.0,
      ),
      isDense: true,
      errorStyle: const TextStyle(color: BringooColors.error, fontSize: 12.0),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: BringooColors.error),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: BringooColors.error),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: WidgetStateBorderSide.resolveWith((states) {
        const Set<WidgetState> activeState = <WidgetState>{
          WidgetState.selected,
        };
        if (states.any(activeState.contains)) {
          return const BorderSide(width: 1, color: BringooColors.primary);
        }
        return const BorderSide(width: 2, color: BringooColors.neutral);
      }),
    ),
  );
}

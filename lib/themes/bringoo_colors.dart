import 'package:flutter/material.dart';

class BringooColors {
  static const MaterialColor neutral =
      MaterialColor(_neutralPrimaryValue, <int, Color>{
        50: Color(0xFFF9F9F9),
        100: Color(0xFFF3F4F3),
        200: Color(0xFFE7E8E8),
        300: Color(0xFFD5D7D6),
        400: Color(0xFFC4C6C4),
        500: Color(_neutralPrimaryValue),
        600: Color(0xFF818682),
        700: Color(0xFF636764),
        800: Color(0xFF454846),
        900: Color(0xFF282928),
      });
  static const int _neutralPrimaryValue = 0xFFA0A4A1;

  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
        50: Color(0xFFE9FAED),
        100: Color(0xFFD3F5DB),
        200: Color(0xFFA8ECB6),
        300: Color(0xFF7CE292),
        400: Color(0xFF51D96D),
        500: Color(_primaryPrimaryValue),
        600: Color(0xFF23A03E),
        700: Color(0xFF1A782E),
        800: Color(0xFF12501F),
        900: Color(0xFF09280F),
      });
  static const int _primaryPrimaryValue = 0xFF2CC84D;

  static const MaterialColor secondary =
      MaterialColor(_secondaryPrimaryValue, <int, Color>{
        50: Color(0xFFFCFBF9),
        100: Color(0xFFF9F6F3),
        200: Color(0xFFF3EDE8),
        300: Color(0xFFEEE5DC),
        400: Color(0xFFE8DCD1),
        500: Color(_secondaryPrimaryValue),
        600: Color(0xFFC6A88D),
        700: Color(0xFFA97D55),
        800: Color(0xFF715438),
        900: Color(0xFF382A1C),
      });
  static const int _secondaryPrimaryValue = 0xFFE2D3C5;

  static const MaterialColor success =
      MaterialColor(_successPrimaryValue, <int, Color>{
        50: Color(0xFFECFDF5),
        100: Color(0xFFD1FAE5),
        200: Color(0xFFA7F3D0),
        300: Color(0xFF6EE7B7),
        400: Color(0xFF34D399),
        500: Color(_successPrimaryValue),
        600: Color(0xFF059669),
        700: Color(0xFF047857),
        800: Color(0xFF065F46),
        900: Color(0xFF064E3B),
      });
  static const int _successPrimaryValue = 0xFF10B981;

  static const MaterialColor warning =
      MaterialColor(_warningPrimaryValue, <int, Color>{
        50: Color(0xFFFFFBEB),
        100: Color(0xFFFEF3C7),
        200: Color(0xFFFDE68A),
        300: Color(0xFFFCD34D),
        400: Color(0xFFFBBF24),
        500: Color(_warningPrimaryValue),
        600: Color(0xFFD97706),
        700: Color(0xFFB45309),
        800: Color(0xFF92400E),
        900: Color(0xFF78350F),
      });
  static const int _warningPrimaryValue = 0xFFF59E0B;

  static const MaterialColor error =
      MaterialColor(_errorPrimaryValue, <int, Color>{
        50: Color(0xFFFEF2F2),
        100: Color(0xFFFEE2E2),
        200: Color(0xFFFECACA),
        300: Color(0xFFFCA5A5),
        400: Color(0xFFF87171),
        500: Color(_errorPrimaryValue),
        600: Color(0xFFDC2626),
        700: Color(0xFFB91C1C),
        800: Color(0xFF991B1B),
        900: Color(0xFF7F1D1D),
      });
  static const int _errorPrimaryValue = 0xFFEF4444;

  static const MaterialColor darkBlue =
      MaterialColor(_darkBluePrimaryValue, <int, Color>{
        50: Color(0xFFEDF4FA),
        100: Color(0xFFCADDF0),
        200: Color(0xFF95BBE1),
        300: Color(0xFF5F9AD3),
        400: Color(0xFF2F6CA8),
        500: Color(_darkBluePrimaryValue),
        600: Color(0xFF1A3C5D),
        700: Color(0xFF142E48),
        800: Color(0xFF0E2032),
        900: Color(0xFF08121D),
      });
  static const int _darkBluePrimaryValue = 0xFF204A73;

  static const MaterialColor mainGrey =
      MaterialColor(_mainGreyPrimaryValue, <int, Color>{
        50: Color(0xFFE8E8E8),
        100: Color(0xFFD1D1D1),
        200: Color(0xFFA3A3A4),
        300: Color(0xFF757576),
        400: Color(0xFF474748),
        500: Color(_mainGreyPrimaryValue),
        600: Color(0xFF181819),
        700: Color(0xFF121213),
        800: Color(0xFF0C0C0C),
        900: Color(0xFF060606),
      });
  static const int _mainGreyPrimaryValue = 0xFF1E1E1F;

  static const MaterialColor oceanTeal =
      MaterialColor(_oceanTealPrimaryValue, <int, Color>{
        50: Color(0xFFEDF8F7),
        100: Color(0xFFD2EEEC),
        200: Color(0xFFB4E3E0),
        300: Color(0xFF96D8D3),
        400: Color(0xFF80CFC9),
        500: Color(_oceanTealPrimaryValue),
        600: Color(0xFF64B5AD),
        700: Color(0xFF59ACA4),
        800: Color(0xFF4FA49C),
        900: Color(0xFF3D968C),
      });
  static const int _oceanTealPrimaryValue = 0xFF6CBBB5;
}

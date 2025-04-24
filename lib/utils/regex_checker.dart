class RegexChecker {
  static bool isAtLeastEightCharacter(String textInput) {
    return textInput.length > 7;
  }

  static isAtLeastOneUppercase(String textInput) {
    return RegExp('(?:[^A-Z]*[A-Z]){1}').hasMatch(textInput);
  }

  static isAtLeastOneLowercase(String textInput) {
    return RegExp('(?:[^a-z]*[a-z]){1}').hasMatch(textInput);
  }

  static isAtLeastOneSpecialCharacter(String textInput) {
    return RegExp(
      '(?:[!@#\$%^&*()_\\-=+\\[\\]{}:;~\\?]){1}',
    ).hasMatch(textInput);
  }

  static isAtLeastOneNumber(String textInput) {
    return RegExp('.*[0-9].*').hasMatch(textInput);
  }
}

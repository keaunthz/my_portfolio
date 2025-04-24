import 'package:flutter/services.dart';

class AppUtils {
  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

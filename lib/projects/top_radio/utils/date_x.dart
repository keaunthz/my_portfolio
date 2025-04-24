import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateX on DateTime? {
  String get formatShortDate {
    if (this == null) {
      return "";
    }
    return DateFormat("dd/MM/yy", "th-TH").format(this!);
  }

  String get formatThaiDate {
    if (this == null) {
      return "";
    }
    return DateFormat("dd MMM yyyy", "th-TH").format(this!);
  }

  String get formatThaiFullDate {
    if (this == null) {
      return "";
    }
    return DateFormat("EEEE dd MMMM yyyy", "th-TH").format(this!);
  }

  String get formatShortDateBuddhist {
    if (this == null) {
      return "";
    }
    return DateFormat("dd/MM/yyyy", "th-TH").format(this!);
  }
}

extension TimeOfDayX on TimeOfDay? {
  String get format24Hours {
    if (this == null) {
      return "";
    }
    return "${this!.hour.toString().padLeft(2, '0')}:${this!.minute.toString().padLeft(2, '0')}";
  }
}

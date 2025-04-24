import 'package:easy_mask/easy_mask.dart';
import 'package:intl/intl.dart';

class CurrencyUtils {
  static double parseUnformattedCurrency(String value) {
    return double.tryParse(value.replaceAll('.', '').replaceAll(',', '.')) ??
        0.0;
  }

  static String parseToEuroFormat(dynamic value) {
    // if (value == null) return
    return NumberFormat("#,##0.00", "de_DE").format(value);
  }

  static final currencyInputMask = TextInputMask(
    mask: '999.999.999,99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
  );

  static final currencyNumberOnly = TextInputMask(
    mask: '999.999.999',
    placeholder: '0',
    maxPlaceHolders: 1,
    reverse: true,
  );
}

class NumberFormatUtil {
  static final numberOnly = TextInputMask(
    mask: '9*',
    placeholder: '0',
    maxPlaceHolders: 1,
    reverse: true,
  );
}

class DateTimeFormatUtil {
  static final dateTimeFormat = DateFormat('dd/MM/yyyy');
  static final dateTimeFormatWithTime = DateFormat('dd MMM yyyy, hh:mm a');

  static String parseDateToLocal(String? dateTime) {
    return DateTimeFormatUtil.dateTimeFormatWithTime.format(dateTime != null
        ? DateTime.parse(dateTime).toUtc().toLocal()
        : DateTime.now());
  }
}

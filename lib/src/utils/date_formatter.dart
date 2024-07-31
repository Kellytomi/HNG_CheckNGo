import 'package:intl/intl.dart';

extension Formatter on DateTime {
  String get daySuffix {
    return switch (day) {
      1 => 'st',
      2 => 'nd',
      3 => 'rd',
      _ => 'th',
    };
  }

  String get timeMSuffix {
    if (hour >= 12) {
      return 'PM';
    } else {
      return 'AM';
    }
  }

  String get vDateFormat {
    final tempDay = DateFormat('dd').format(this) + daySuffix;
    final tempMonthYear = DateFormat('MMMM, yyyy').format(this);
    return '$tempDay $tempMonthYear';
  }

  String get vTimeFormat {
    final tempTime = DateFormat('hh:mm').format(this);
    return '$tempTime$timeMSuffix';
  }

  String get vDTFormat {
    return '$vDateFormat, $vTimeFormat';
  }
}

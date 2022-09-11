import 'package:intl/intl.dart';

class DateUtil {
  DateUtil._();

  static String getDayMonth() {
    return DateFormat("dd/MM").format(DateTime.now());
  }
}
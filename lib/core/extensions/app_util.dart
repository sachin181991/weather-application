import 'package:intl/intl.dart';

class AppUtil {
  AppUtil._();

  static String hourMinuteDateDateFormat({String? date}) =>
      DateFormat('kk:mm a | dd - MMM').format(
          DateFormat('dd-MM-yyyy HH:mm').parse(date!)); //11-MAY-2023 6:00
}

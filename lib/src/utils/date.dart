import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  String timeFormatted([bool full = false]) {
    if (full) {
      return DateFormat('HH:mm:ss').format(this);
    } else {
      return DateFormat('HH:mm').format(this);
    }
  }

  String dateFormatted() {
    if (isToday()) {
      return 'Hôm nay';
    } else if (isYesterday()) {
      return 'Hôm qua';
    } else {
      return DateFormat('dd/MM/yyyy').format(this);
    }
  }

  String dateTimeFormatted() {
    return '${timeFormatted()} - ${dateFormatted()}';
  }

  String shortDateTimeFormatted() {
    if (isToday()) {
      return timeFormatted(true);
    } else {
      return dateTimeFormatted();
    }
  }
}

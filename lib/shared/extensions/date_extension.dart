extension DateExtension on DateTime {
  String get formatDate {
    final formattedDay = day.toString().padLeft(2, '0');
    final formattedMonth = month.toString().padLeft(2, '0');
    final formattedYear = year.toString();

    return '$formattedDay/$formattedMonth/$formattedYear';
  }
}

class DateUtils {
  static int getDiffInSeconds(DateTime date) {
    final Duration duration = date.difference(DateTime.now());
    return duration.inSeconds;
  }

  static DateTime toDate(String date) {
    return DateTime.parse(date);
  }
}

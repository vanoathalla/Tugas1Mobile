class UsiaController {
  Map<String, int> hitungUsiaDetail(DateTime birth, DateTime now) {
    int years = now.year - birth.year;
    int months = now.month - birth.month;
    int days = now.day - birth.day;

    if (days < 0) {
      months -= 1;
      days += DateTime(now.year, now.month, 0).day;
    }
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    Duration diff = now.difference(birth);
    return {
      'years': years,
      'months': months,
      'days': days,
      'hours': diff.inHours % 24,
      'minutes': diff.inMinutes % 60,
    };
  }
}

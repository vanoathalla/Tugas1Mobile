class UsiaController {
  String hitungUsiaDetail(DateTime birth) {
    DateTime now = DateTime.now();
    Duration diff = now.difference(birth);

    int years = now.year - birth.year;
    int months = now.month - birth.month;
    if (months < 0 || (months == 0 && now.day < birth.day)) {
      years--;
      months += 12;
    }

    return "$years Tahun, $months Bulan\n${diff.inDays % 30} Hari\n${diff.inHours % 24} Jam, ${diff.inMinutes % 60} Menit";
  }
}

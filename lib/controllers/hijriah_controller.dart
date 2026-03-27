class HijriahController {
  String formatHijriah(DateTime date) {
    // Algoritma Kuwati (Perhitungan Astronomis Sederhana)
    int jd = date.millisecondsSinceEpoch ~/ 86400000 + 2440588;
    int l = jd - 1948440 + 10632;
    int n = ((l - 1) / 10631).floor();
    l = l - 10631 * n + 354;
    int j =
        (((10985 - l) / 5316).floor()) * (((50 * l) / 17719).floor()) +
        (((l - 2) / 2623).floor()) * (((30 * l) / 10692).floor());
    l = l - (((17719 * j) / 50).floor()) - (((10692 * j) / 30).floor()) + 57;
    int m = ((l * 25) / 739).floor();
    int d = l - ((m * 739) / 25).floor();
    int y = 30 * n + j - 30;

    List<String> bulan = [
      "Muharram",
      "Safar",
      "Rabi'ul Awal",
      "Rabi'ul Akhir",
      "Jumadil Awal",
      "Jumadil Akhir",
      "Rajab",
      "Sya'ban",
      "Ramadhan",
      "Syawal",
      "Dzulqa'dah",
      "Dzulhijjah",
    ];
    return "$d ${bulan[m - 1]} $y H";
  }
}

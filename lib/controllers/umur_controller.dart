class UmurController {
  Map<String, int> hitungDetail(DateTime lahir) {
    DateTime sekarang = DateTime.now();
    Duration diff = sekarang.difference(lahir);

    int tahun = sekarang.year - lahir.year;
    int bulan = sekarang.month - lahir.month;
    int hari = sekarang.day - lahir.day;

    // Logika penyesuaian jika hari/bulan minus
    if (hari < 0) {
      bulan--;
      // Ambil tanggal terakhir dari bulan sebelumnya
      hari += DateTime(sekarang.year, sekarang.month, 0).day;
    }
    if (bulan < 0) {
      tahun--;
      bulan += 12;
    }

    return {
      "tahun": tahun,
      "bulan": bulan,
      "hari": hari,
      "jam": diff.inHours % 24,
      "menit": diff.inMinutes % 60,
    };
  }
}

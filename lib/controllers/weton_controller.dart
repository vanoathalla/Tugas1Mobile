class WetonController {
  String hitungWeton(DateTime tanggal) {
    // Daftar nama hari dan pasaran
    List<String> hari = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
      "Minggu",
    ];
    List<String> pasaran = ["Legi", "Pahing", "Pon", "Wage", "Kliwon"];

    // 1 Januari 1970 itu hari Kamis (index 3) dan pasaran Pon (index 2)
    DateTime baseDate = DateTime(1970, 1, 1);
    int selisihHari = tanggal.difference(baseDate).inDays;

    String namaHari = hari[(tanggal.weekday - 1)];
    // Rumus pasaran: selisih hari + index dasar (2 untuk Pon) modulo 5
    String namaPasaran = pasaran[(selisihHari + 2) % 5];

    return "$namaHari $namaPasaran";
  }
}

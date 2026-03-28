class WetonController {
  String hitungWeton(DateTime tanggal) {
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

    DateTime baseDate = DateTime(1970, 1, 1);
    int selisihHari = tanggal.difference(baseDate).inDays;

    String namaHari = hari[(tanggal.weekday - 1)];
    // Rumus pasaran: selisih hari + index dasar (3) modulo 5
    String namaPasaran = pasaran[(selisihHari + 3) % 5];

    return "$namaHari $namaPasaran";
  }
}

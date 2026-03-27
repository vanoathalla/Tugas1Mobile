class WetonController {
  String hitungWeton(DateTime date) {
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

    // Base date untuk perhitungan Jawa (contoh: 1 Januari 1970 adalah Kamis Pon)
    DateTime baseDate = DateTime(1970, 1, 1);
    int diff = date.difference(baseDate).inDays;

    String namaHari = hari[(date.weekday - 1)];
    // Offset 2 karena 1 Jan 1970 adalah Pon (index 2)
    String namaPasaran = pasaran[(diff + 2) % 5];

    return "$namaHari $namaPasaran";
  }
}

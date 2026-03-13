class JumlahFieldController {
  // Fungsi ini bertugas memecah teks dan menjumlahkan semua angka di dalamnya
  String hitungTotal(String inputText) {
    // Pisahin string input berdasarkan koma atau spasi
    List<String> angkaString = inputText.split(RegExp(r'[,\s]+'));
    
    int total = 0;

    for (var str in angkaString) {
      if (str.isNotEmpty) {
        // Parsing string jadi integer dan jumlahin
        total += int.tryParse(str) ?? 0;
      }
    }

    // Kembalikan hasilnya dalam bentuk teks buat ditampilin di layar
    return total.toString();
  }
}
import 'dart:math'; 

class PiramidController {
  // Mengembalikan 2 nilai sekaligus (Volume dan Luas) pakai Map
  Map<String, String> hitungPiramid(String sisiText, String tinggiText) {
    double sisi = double.tryParse(sisiText) ?? 0;
    double tinggi = double.tryParse(tinggiText) ?? 0;

    // Hitung Volume (1/3 * Luas Alas * Tinggi)
    double volume = (1 / 3) * (sisi * sisi) * tinggi;

    // Hitung Luas Permukaan (Luas Alas + 4 * Luas Segitiga Tegak)
    // Hitung tinggi miring segitiga tegak pake pythagoras
    double tinggiMiring = sqrt(pow((sisi / 2), 2) + pow(tinggi, 2));
    double luasPermukaan = (sisi * sisi) + (4 * (0.5 * sisi * tinggiMiring));

    // Return hasilnya yang udah dibulatkan 2 angka di belakang koma
    return {
      'volume': volume.toStringAsFixed(2),
      'luas': luasPermukaan.toStringAsFixed(2),
    };
  }
}
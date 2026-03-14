import 'dart:math';

class PiramidController {
  Map<String, String> hitungPiramid(String sisiText, String tinggiText) {
    double sisi = double.tryParse(sisiText) ?? 0;
    double tinggi = double.tryParse(tinggiText) ?? 0;

    double volume = (1 / 3) * (sisi * sisi) * tinggi;

    double tinggiMiring = sqrt(pow((sisi / 2), 2) + pow(tinggi, 2));
    double luasPermukaan = (sisi * sisi) + (4 * (0.5 * sisi * tinggiMiring));

    return {
      'volume': volume.toStringAsFixed(2),
      'luas': luasPermukaan.toStringAsFixed(2),
    };
  }
}

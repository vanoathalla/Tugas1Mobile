import 'package:intl/intl.dart';

class WetonController {
  String hitungWeton(DateTime date) {
    final List<String> pasaran = ["Legi", "Pahing", "Pon", "Wage", "Kliwon"];
    DateTime baseDate = DateTime(1970, 1, 2); // Jumat Legi
    int diff = date.difference(baseDate).inDays;

    // Solusi biar gak error pas tanggal mundur:
    int index = diff % 5;
    if (index < 0) index += 5;

    String hari = DateFormat('EEEE', 'id_ID').format(date);
    return "$hari ${pasaran[index]}";
  }
}

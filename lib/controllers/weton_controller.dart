import 'package:intl/intl.dart';

class WetonController {
  String hitungWeton(DateTime date) {
    // Referensi: 2 Januari 1970 adalah Jumat Legi
    final List<String> pasaran = ["Legi", "Pahing", "Pon", "Wage", "Kliwon"];
    DateTime baseDate = DateTime(1970, 1, 2);
    int diff = date.difference(baseDate).inDays;

    // Menggunakan locale Indonesia untuk nama hari
    String hari = DateFormat('EEEE', 'id_ID').format(date);
    String jawa = pasaran[diff % 5];

    return "$hari $jawa";
  }
}

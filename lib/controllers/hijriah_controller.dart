import 'package:hijri/hijri_calendar.dart';

class HijriahController {
  String konversiKeHijriah(DateTime tanggal) {
    try {
      var hDate = HijriCalendar.fromDate(tanggal);
      // Coba pakai susunan manual kalau toVisualString() masih merah
      return "${hDate.hDay} ${hDate.longMonthName} ${hDate.hYear} H";
    } catch (e) {
      return "Format Error";
    }
  }
}

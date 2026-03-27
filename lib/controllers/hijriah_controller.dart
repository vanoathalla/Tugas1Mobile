import 'package:hijri/hijri_calendar.dart';

class HijriahController {
  String konversi(DateTime date) {
    var hDate = HijriCalendar.fromDate(date);
    return hDate.toVisualString(); // Contoh: 14 Ramadan 1445
  }
}

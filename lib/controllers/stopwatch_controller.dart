class StopwatchController {
  String formatWaktu(int milliseconds) {
    Duration d = Duration(milliseconds: milliseconds);

    // Ambil bagian-bagian waktunya
    int days = d.inDays;
    int hours = d.inHours % 24;
    int minutes = d.inMinutes % 60;
    int seconds = d.inSeconds % 60;
    int hundreds = (milliseconds / 10).truncate() % 100;

    // Format angka biar selalu 2 digit (contoh: 01, 02)
    String h = hours.toString().padLeft(2, '0');
    String m = minutes.toString().padLeft(2, '0');
    String s = seconds.toString().padLeft(2, '0');
    String ms = hundreds.toString().padLeft(2, '0');

    // Kalau sudah lewat 24 jam, tambahkan teks "hari"
    if (days > 0) {
      return "$days hari, $h:$m:$s,$ms";
    } else {
      return "$h:$m:$s,$ms";
    }
  }
}

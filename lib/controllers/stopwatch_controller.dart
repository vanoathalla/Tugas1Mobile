class StopwatchController {
  final Stopwatch _stopwatch = Stopwatch();

  bool get isRunning => _stopwatch.isRunning;
  int get elapsedMilliseconds => _stopwatch.elapsedMilliseconds;

  void start() => _stopwatch.start();
  void stop() => _stopwatch.stop();
  void reset() => _stopwatch.reset();

  String formatWaktu(int milliseconds) {
    int ratusan = (milliseconds / 10).truncate() % 100;
    int detik = (milliseconds / 1000).truncate() % 60;
    int menit = (milliseconds / (1000 * 60)).truncate() % 60;

    String menitStr = menit.toString().padLeft(2, '0');
    String detikStr = detik.toString().padLeft(2, '0');
    String ratusanStr = ratusan.toString().padLeft(2, '0');

    return "$menitStr:$detikStr:$ratusanStr";
  }
}

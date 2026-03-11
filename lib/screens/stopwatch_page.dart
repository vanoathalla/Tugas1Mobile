import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    _stopwatch.start();
  }

  void _stopTimer() {
    _timer?.cancel();
    _stopwatch.stop();
    setState(() {});
  }

  void _resetTimer() {
    _stopTimer();
    _stopwatch.reset();
    setState(() {});
  }

  String _formatWaktu(int milliseconds) {
    int ratusan = (milliseconds / 10).truncate() % 100;
    int detik = (milliseconds / 1000).truncate() % 60;
    int menit = (milliseconds / (1000 * 60)).truncate() % 60;

    String menitStr = menit.toString().padLeft(2, '0');
    String detikStr = detik.toString().padLeft(2, '0');
    String ratusanStr = ratusan.toString().padLeft(2, '0');

    return "$menitStr:$detikStr:$ratusanStr";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch Kalcer')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tampilan Waktu yang modern
            Text(
              _formatWaktu(_stopwatch.elapsedMilliseconds),
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
                color: Colors.blueGrey800,
              ),
            ),
            const SizedBox(height: 60),

            // Tombol Kontrol responsif ala iOS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  'Start',
                  Icons.play_arrow_outlined,
                  Colors.teal,
                  _stopwatch.isRunning ? null : _startTimer,
                ),
                const SizedBox(width: 20),
                _buildActionButton(
                  'Stop',
                  Icons.stop_outlined,
                  Colors.orange,
                  _stopwatch.isRunning ? _stopTimer : null,
                ),
                const SizedBox(width: 20),
                _buildActionButton(
                  'Reset',
                  Icons.refresh_outlined,
                  Colors.redAccent,
                  _resetTimer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback? onPressed,
  ) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: onPressed != null ? Colors.white : Colors.blueGrey[400],
        ),
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: onPressed != null ? 3 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(0, 60),
        ),
      ),
    );
  }
}

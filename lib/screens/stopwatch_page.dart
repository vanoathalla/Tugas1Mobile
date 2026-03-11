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
      appBar: AppBar(
        title: const Text('Stopwatch'),
        backgroundColor: Colors.teal[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatWaktu(_stopwatch.elapsedMilliseconds),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? null : _startTimer,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: const Text('Start'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _stopTimer : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _resetTimer,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import '../controllers/stopwatch_controller.dart'; // Import controllernya

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  // Inisialisasi Controller
  final StopwatchController _controller = StopwatchController();
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (mounted) {
        setState(() {}); // Refresh UI
      }
    });
    // Perintah start dilempar ke Controller
    _controller.start();
  }

  void _stopTimer() {
    _timer?.cancel();
    // Perintah stop dilempar ke Controller
    _controller.stop();
    setState(() {});
  }

  void _resetTimer() {
    _stopTimer();
    // Perintah reset dilempar ke Controller
    _controller.reset();
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // View minta tolong Controller buat nge-format angkanya
            Text(
              _controller.formatWaktu(_controller.elapsedMilliseconds),
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  'Start',
                  Icons.play_arrow_outlined,
                  Colors.teal,
                  _controller.isRunning ? null : _startTimer,
                ),
                const SizedBox(width: 20),
                _buildActionButton(
                  'Stop',
                  Icons.stop_outlined,
                  Colors.orange,
                  _controller.isRunning ? _stopTimer : null,
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

  // Fungsi helper tombol (TIDAK DIUBAH SAMA SEKALI)
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
